#!/bin/bash
#rescue-cluster.sh <namespace>
#Debug + clean up a Kubernetes cluster in minutes

NAMESPACE=${1:-default}

echo "== Checking pod health in $NAMESPACE =="
kubectl get pods -n $NAMESPACE -o wide

echo -e "\n== Collecting logs from failing pods =="
for pod in $(kubectl get pods -n $NAMESPACE --no-headers | awk '$3=="CrashLoopBackOff"{print $1}'); do
  echo -e "\n--- Logs for $pod ---"
  kubectl logs -n $NAMESPACE $pod --previous | tail -n 20
done

echo -e "\n== Cleaning up unused resources =="
kubectl delete pod --field-selector=status.phase=Failed -n $NAMESPACE
kubectl delete pod --field-selector=status.phase=Succeeded -n $NAMESPACE

echo -e "\n== Removing dangling images on all nodes =="
for node in $(kubectl get nodes --no-headers | awk '{print $1}'); do
  echo "Cleaning node: $node"
  ssh $node "sudo docker system prune -af || sudo podman system prune -af"
done

echo -e "\n== Cluster Disk Usage =="
kubectl top nodes
