#!/usr/bin/bash
set -ex

sleep 20
# test1
timeout 20 curl -s http://130.211.212.231:5000/

# <-- שורה מעודכנת -->
echo "Test finished successfully"  # פלט מובנה לפלט של Jenkins
