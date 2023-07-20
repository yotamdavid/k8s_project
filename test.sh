#!/usr/bin/bash
set -ex

sleep 20

# Get the current cluster IP
CLUSTER_IP=$(kubectl cluster-info | grep 'Kubernetes control plane is running at' | awk '{print $NF}')

# Run your tests using the cluster IP
timeout 20 curl -s --cluster-ip $CLUSTER_IP

# <-- שורה מעודכנת -->
echo "Test finished successfully"  # פלט מובנה לפלט של Jenkins
