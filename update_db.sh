#!/bin/bash

# Get the pod name of MySQL
pod_name=$(kubectl get pods -l app=mysql -o jsonpath='{.items[0].metadata.name}')

# Exec into the pod and run the SQL commands
kubectl exec -it "$pod_name" -- /bin/sh -c 'mysql -u root -pyotam -e "CREATE DATABASE IF NOT EXISTS users; USE users; CREATE TABLE IF NOT EXISTS users (id INT PRIMARY KEY AUTO_INCREMENT, username VARCHAR(50) NOT NULL, password_hash VARCHAR(255) NOT NULL);"'
