#!/bin/bash

# Function to apply RabbitMQ manifest and update RabbitMQ URL in api-gateway-secret.yaml
apply_rabbitmq_manifest() {
    echo "Applying RabbitMQ manifest..."
    kubectl apply -f Manifests/rabbitmq/

    # Retry loop to extract the IP address
    while true; do
        # Run kubectl describe command and store the output
        describe_output=$(kubectl describe svc rabbitmq-service)

        # Extract the IP address using grep and awk
        ip_address=$(echo "$describe_output" | awk '/Endpoints:/ {print $2}' | cut -d ':' -f1)

        # Check if the IP address is not <none>
        if [ "$ip_address" != "<none>" ]; then
            break  # Exit the loop if IP address is obtained
        else
            echo "IP address not available. Retrying..."
            sleep 5  # Wait for 5 seconds before retrying
        fi
    done

    # Construct the RabbitMQ URL using the extracted IP address
    rabbitmq_url="amqp://danilo:dan1234@$ip_address:5672"
    echo "RabbitMQ URL: $rabbitmq_url"

    # Encode the RabbitMQ URL to base64
    rabbitmq_url_base64=$(echo -n "$rabbitmq_url" | base64)
    echo "Base64 Encoded RabbitMQ URL: $rabbitmq_url_base64"

    # Update RabbitMQ URL in api-gateway-secret.yaml
    sed -i "" "s|RABBITMQ_URL: .*|RABBITMQ_URL: $rabbitmq_url_base64|g" Manifests/api-gateway/api-gateway-secret.yaml
    echo "api-gateway-secret.yaml updated with new RabbitMQ URL"
}
