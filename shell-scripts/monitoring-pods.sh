#!/bin/bash
SERVICE="payment-service"
NAMESPACE="default"

echo "Monitoring $SERVICE in namespace $NAMESPACE..."

while true; do
  for pod in $(kubectl get pods -n $NAMESPACE -l app=$SERVICE --field-selector=status.phase!=Running -o jsonpath='{.items[*].metadata.name}'); do
    echo "[$(date)] Pod $pod is not Running. Restarting..."
    kubectl delete pod $pod -n $NAMESPACE
  done
  sleep 30
done
