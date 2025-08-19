#!/bin/bash
SERVICE="payment-service"
NAMESPACE="default"

echo "Monitoring $SERVICE in namespace $NAMESPACE..."

while true; do
  for pod in $(kubectl get pods -n $NAMESPACE -l app=$SERVICE -o jsonpath='{.items[*].metadata.name}'); do
    PHASE=$(kubectl get pod $pod -n $NAMESPACE -o jsonpath='{.status.phase}')
    REASON=$(kubectl get pod $pod -n $NAMESPACE -o jsonpath='{.status.containerStatuses[0].state.waiting.reason}' 2>/dev/null)

    #Skip Running or Succeeded pods
    if [[ "$PHASE" == "Running" || "$PHASE" == "Succeeded" ]]; then
      continue
    fi

    #Skip Pending unless stuck
    if [[ "$PHASE" == "Pending" ]]; then
      AGE=$(kubectl get pod $pod -n $NAMESPACE -o jsonpath='{.metadata.creationTimestamp}')
      # Add logic to check pod age and decide if deletion is safe
      continue
    fi

    #Skip StatefulSet pods
    OWNER_KIND=$(kubectl get pod $pod -n $NAMESPACE -o jsonpath='{.metadata.ownerReferences[0].kind}')
    if [[ "$OWNER_KIND" == "StatefulSet" ]]; then
      echo "[$(date)] Pod $pod is part of a StatefulSet. Skipping manual delete."
      continue
    fi

    #If Failed, Unknown, or CrashLoopBackOff → delete
    if [[ "$PHASE" == "Failed" || "$PHASE" == "Unknown" || "$REASON" == "CrashLoopBackOff" ]]; then
      echo "[$(date)] Pod $pod in $PHASE / $REASON. Restarting..."
      kubectl delete pod $pod -n $NAMESPACE
    fi
  done
  sleep 30
done
