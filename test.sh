#!/usr/bin/bash
set -ex

sleep 40
# Function to check if the LoadBalancer IP address is available
check_loadbalancer_ip() {
    CLUSTER_IP=$(kubectl get service docker-app-service -o=jsonpath='{.status.loadBalancer.ingress[0].ip}')
    if [ -z "$CLUSTER_IP" ]; then
        echo "LoadBalancer IP not found. Retrying in 5 seconds..."
        sleep 5
        check_loadbalancer_ip
    fi
}

# Wait for the LoadBalancer IP address
check_loadbalancer_ip

# Run your tests using the LoadBalancer IP
timeout 20 curl -s "http://$CLUSTER_IP:5000/"

echo "Test finished successfully"
