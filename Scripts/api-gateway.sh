#!/bin/bash

# Function to apply RabbitMQ manifest and update RabbitMQ URL in api-gateway-secret.yaml
apply_apigateway_manifest() {
    echo "Applying api-gateway manifest..."
    kubectl apply -f Manifests/api-gateway/
}
