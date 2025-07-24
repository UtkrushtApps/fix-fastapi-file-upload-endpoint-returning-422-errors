#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

IMAGE_NAME="fastapi-upload-assessment"
CONTAINER_NAME="fastapi-upload-container"

# Build Docker image
echo "Building Docker image..."
docker build -t $IMAGE_NAME .

echo "Checking for existing container..."
if [ $(docker ps -a -q -f name=$CONTAINER_NAME) ]; then
  echo "Removing old container..."
  docker rm -f $CONTAINER_NAME || true
fi

echo "Starting Docker container..."
docker run -d --name $CONTAINER_NAME -p 8000:8000 $IMAGE_NAME

echo "Container is running."
