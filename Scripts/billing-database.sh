#!/bin/bash

# Function to apply billing-database manifest and update PGHOST in billing-app-secret.yaml
apply_billingdatabase_manifest() {
    echo "Applying billing-database manifests..."
    kubectl apply -f ./Manifests/billing-database/

    # Retry loop to extract the IP address
    while true; do
        # Run kubectl describe command and store the output
        describe_output=$(kubectl describe svc billing-database)

        # Extract the first IP address using awk and cut
        ip_address=$(echo "$describe_output" | awk '/Endpoints:/ {print $2}' | cut -d ',' -f1 | cut -d ':' -f1)

        # Check if the IP address is not <none>
        if [ "$ip_address" != "<none>" ] && [ -n "$ip_address" ]; then
            break  # Exit the loop if IP address is obtained
        else
            echo "billing-database getting ready..."
            sleep 5  # Wait for 5 seconds before retrying
        fi
    done

    # Encode the IP address to base64
    ip_address_base64=$(echo -n "$ip_address" | base64)

    # Update PGHOST in billing-app-secret.yaml
    sed -i "" "s|PGHOST: .*|PGHOST: $ip_address_base64|g" Manifests/billing-app/billing-app-secret.yaml

    echo "billing-database done"
}
