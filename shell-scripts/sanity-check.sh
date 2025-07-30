#!/bin/bash

#sanity-check.sh - 🚀 Proactive DevOps Daily Health Script 🚀
#Author: Vijay Kumar Anuganti
#Date: $(date +%Y-%m-%d)

set -euo pipefail
IFS=$'\n\t'

#=== CONFIGURATION ===
PROD_URL="https://api.myapp.com/health"
STAGING_URL="https://staging.myapp.com/health"
CICD_API="https://ci.mycompany.com/api/job/status"
DISK_THRESHOLD=80
LOG_FILE="/var/log/myapp/app.log"
SANITY_LOG="./sanity-check.log"

#=== COLORS ===
GREEN="\033[0;32m"
RED="\033[0;31m"
YELLOW="\033[1;33m"
NC="\033[0m" # No Color

#=== LOGGING ===
exec > >(tee -a "$SANITY_LOG") 2>&1

echo -e "${YELLOW}===== SANITY CHECK STARTED: $(date) =====${NC}"

#=== UTILS ===
check_command() {
  command -v "$1" &>/dev/null || {
    echo -e "${RED}❌ Required command '$1' not found. Exiting.${NC}"
    exit 1
  }
}

http_check() {
  local url=$1
  if curl -fs --max-time 5 "$url" >/dev/null; then
    echo -e "${GREEN}🫰 $url is healthy${NC}"
  else
    echo -e "${RED}❌ $url is not responding${NC}"
    return 1
  fi
}

retry() {
  local -r -i max_attempts="$1"; shift
  local -r -i sleep_time="$1"; shift
  local -i attempt_num=1

  until "$@"; do
    if (( attempt_num == max_attempts )); then
      echo -e "${RED}💥 Failed after $attempt_num attempts.${NC}"
      return 1
    else
      echo -e "${YELLOW}🔁 Attempt $attempt_num failed. Retrying in $sleep_time sec...${NC}"
      sleep "$sleep_time"
      ((attempt_num++))
    fi
  done
}

#=== CHECKS ===

check_ping() {
  echo -e "\n🌐 ${YELLOW}Pinging Hosts...${NC}"
  for host in api.myapp.com staging.myapp.com; do
    if ping -c 2 "$host" &>/dev/null; then
      echo -e "${GREEN}🫰 $host is reachable${NC}"
    else
      echo -e "${RED}❌ $host is unreachable${NC}"
    fi
  done
}

check_http_health() {
  echo -e "\n🔍 ${YELLOW}Checking Health Endpoints...${NC}"
  retry 3 2 http_check "$PROD_URL"
  retry 3 2 http_check "$STAGING_URL"
}

check_cicd_status() {
  echo -e "\n🛠️  ${YELLOW}Checking CI/CD Pipeline...${NC}"
  check_command jq
  local status
  status=$(curl -s "$CICD_API" | jq -r '.lastBuild.status // "unknown"')
  echo -e "📦 CI/CD Last Build Status: ${GREEN}$status${NC}"
}

check_disk_space() {
  echo -e "\n💾 ${YELLOW}Checking Disk Usage...${NC}"
  local usage
  usage=$(df / | awk 'NR==2 {gsub(/%/, "", $5); print $5}')
  if (( usage > DISK_THRESHOLD )); then
    echo -e "${RED}⚠️  Disk usage is high: $usage%${NC}"
  else
    echo -e "${GREEN}🫰 Disk usage is healthy: $usage%${NC}"
  fi
}

check_k8s_health() {
  if command -v kubectl &>/dev/null; then
    echo -e "\n☸️  ${YELLOW}Checking Kubernetes Pods...${NC}"
    local bad_pods
    bad_pods=$(kubectl get pods --all-namespaces --field-selector=status.phase!=Running,status.phase!=Succeeded --no-headers || true)
    if [[ -n "$bad_pods" ]]; then
      echo -e "${RED}❌ Non-running pods found:${NC}"
      echo "$bad_pods"
    else
      echo -e "${GREEN}🫰 All pods are running cleanly${NC}"
    fi
  else
    echo -e "${YELLOW}⚠️  kubectl not installed. Skipping K8s check.${NC}"
  fi
}

scan_logs() {
  echo -e "\n📜 ${YELLOW}Scanning Logs for 'error'...${NC}"
  if [[ -f "$LOG_FILE" ]]; then
    local errors
    errors=$(grep -i "error" "$LOG_FILE" | tail -n 5 || true)
    if [[ -n "$errors" ]]; then
      echo -e "${RED}❌ Recent Errors Detected:${NC}"
      echo "$errors"
    else
      echo -e "${GREEN}🫰 No recent 'error' entries in logs${NC}"
    fi
  else
    echo -e "${YELLOW}⚠️  Log file not found: $LOG_FILE${NC}"
  fi
}

summary() {
  echo -e "\n${YELLOW}===== SANITY CHECK COMPLETED: $(date) =====${NC}"
}

#=== MAIN ===
main() {
  check_ping
  check_http_health
  check_cicd_status
  check_disk_space
  check_k8s_health
  scan_logs
  summary
}

main
