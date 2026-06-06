#!/bin/bash

# 1. Initialize variables dynamically using Command Substitution $()
CURRENT_TIME=$(date +"%T")
echo "========================================="
echo "Starting Build Gate Analysis at $CURRENT_TIME"
echo "========================================="

# 2. Simulate a check for your project stack folders
# We will use the -d flag to check if a directory exists
FRONTEND_DIR="./angular"
BACKEND_DIR="./dotnet"

echo "Checking workspace directories..."

# In Bash, spaces inside the [ ] brackets are strictly mandatory!
if [ -d "$FRONTEND_DIR" ] && [ -d "$BACKEND_DIR" ]; then
    echo "✅ Success: Both Frontend and Backend code structures detected."
    echo "Status: System is structurally sound for deployment."
    exit 0
else
    echo "⚠️ Warning: Full monorepo structure not found."
    echo "Creating a mock deployment manifest for verification instead..."
    
    # Let's redirect standard output to create a new file on the fly
    echo "Manifest Created At: $(date)" > workspace-manifest.txt
    echo "Files in current directory:" >> workspace-manifest.txt
    ls -la >> workspace-manifest.txt
    
    echo "--- Contents of Generated Manifest ---"
    cat workspace-manifest.txt
    
    # We exit with 0 so the lab finishes cleanly, even without the folders
    exit 0
fi