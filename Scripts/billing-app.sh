#!/bin/bash

# Function to apply RabbitMQ manifest and update RabbitMQ URL in api-gateway-secret.yaml
apply_billingapp_manifest() {
    echo "Applying billing-app manifest..."
    kubectl apply -f Manifests/billing-app/
}
