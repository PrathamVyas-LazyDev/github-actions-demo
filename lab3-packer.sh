#!/bin/bash

echo "========================================="
echo "Starting Lab 3: The Artifact Packer"
echo "========================================="

# 1. Create a mock build directory to simulate compiled output
echo "Simulating application build output..."
mkdir -p ./dist/app_compiled

# 2. Use a FOR loop to generate multiple mock compiled files on the fly
# This loop runs 3 times, substituting 'i' with 1, 2, and 3
for i in 1 2 3
do
   echo "Streaming binary data chunk $i" > "./dist/app_compiled/service_chunk_$i.bin"
done

echo "Current files inside build directory:"
ls -l ./dist/app_compiled

# 3. Use 'tar' to compress the entire folder into a single archive
# c = create, z = gzip compression, f = file name
echo "Compressing build artifacts into production package..."
tar -czf release-payload.tar.gz ./dist/app_compiled

if [ -f "release-payload.tar.gz" ]; then
    echo "✅ SUCCESS: release-payload.tar.gz created successfully."
    
    # Let's clean up our working directory by removing the loose build folder
    rm -rf ./dist
    
    echo "Workspace cleaned. Ready for artifact shipment."
    exit 0
else
    echo "❌ CRITICAL ERROR: Packaging failed!" >&2
    exit 1 # This non-zero code will explicitly kill the DevOps pipeline
fi