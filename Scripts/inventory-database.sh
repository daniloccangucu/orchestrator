#!/bin/bash

apply_inventorydatabase_manifest() {
    echo "Applying inventory-database manifests..."
    kubectl apply -f ./Manifests/inventory-database/

    # Retry loop to extract the IP address
    while true; do
        describe_output=$(kubectl describe svc inventory-database)
        ip_address=$(echo "$describe_output" | awk '/Endpoints:/ {print $2}' | cut -d ',' -f1 | cut -d ':' -f1)
        if [ "$ip_address" != "<none>" ] && [ -n "$ip_address" ]; then
            break
        else
            echo "inventory-database getting ready..."
            sleep 5
        fi
    done

    ip_address_base64=$(echo -n "$ip_address" | base64)

    sed -i "" "s|PGHOST: .*|PGHOST: $ip_address_base64|g" Manifests/inventory-app/inventory-app-secret.yaml

    echo "inventory-database done"
}
