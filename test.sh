#!/usr/bin/bash
set -ex

sleep 20

# Get the LoadBalancer IP address
CLUSTER_IP=$(kubectl get service docker-app-service -o=jsonpath='{.status.loadBalancer.ingress[0].ip}')

# Check if CLUSTER_IP is empty, if it is, exit the script
if [ -z "$CLUSTER_IP" ]; then
    echo "Error: LoadBalancer IP not found. Exiting..."
    exit 1
fi

# Run your tests using the LoadBalancer IP
timeout 20 curl -s "http://$CLUSTER_IP:5000/"

# <-- שורה מעודכנת -->
echo "Test finished successfully"  # פלט מובנה לפלט של Jenkins
