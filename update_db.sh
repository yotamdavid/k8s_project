#!/bin/bash

# Get the pod name of MySQL
pod_name=$(kubectl get pods -l app=mysql -o jsonpath='{.items[0].metadata.name}')

# Copy the init.sql file into the pod
kubectl cp /home/yotam/Desktop/k8s/k8s_project/init.sql "$pod_name":/tmp/init.sql

# Exec into the pod and run the SQL commands
kubectl exec -it "$pod_name" -- mysql -u root -pyotam users < /tmp/init.sql

# Clean up the copied file from the pod
kubectl exec -it "$pod_name" -- rm /tmp/init.sql
