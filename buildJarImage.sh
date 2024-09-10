#!/bin/bash

# Define variables
APP_NAME="your-application"
JAR_FILE="target/$APP_NAME.jar"
DOCKER_IMAGE_NAME="your-docker-image"

# Step 1: Clean and package the application with Maven
echo "Cleaning and packaging the application with Maven..."
mvn clean package

# Check if the package step was successful
if [ $? -ne 0 ]; then
  echo "Maven build failed. Exiting."
  exit 1
fi

# Step 2: Build the Docker image
echo "Building the Docker image..."
docker build -t $DOCKER_IMAGE_NAME .

# Check if the Docker build step was successful
if [ $? -ne 0 ]; then # $? is a special variable that holds the exit status of the last command, -ne is a comparison operator that means "not equal"
  echo "Docker build failed. Exiting."
  exit 1
fi

echo "Docker image built successfully: $DOCKER_IMAGE_NAME"
