#!/bin/bash

apply_inventoryapp_manifest() {
    echo "Applying inventory-app manifests..."
    kubectl apply -f ./Manifests/inventory-app/

    # Retry loop to extract the IP address
    while true; do
        describe_output=$(kubectl describe svc inventory-app-service)
        ip_address=$(echo "$describe_output" | awk '/IP:/ {print $2}')
        if [ "$ip_address" != "<none>" ] && [ -n "$ip_address" ]; then
            break
        else
            echo "Inventory App IP address not available. Retrying..."
            sleep 5
        fi
    done

    echo "Inventory App IP: $ip_address"
    inventory_api_url="http://$ip_address:8080/movies"
    inventory_api_url_base64=$(echo -n "$inventory_api_url" | base64)
    echo "Base64 Encoded Inventory API URL: $inventory_api_url_base64"

    sed -i "" "s|INVENTORY_API_URL: .*|INVENTORY_API_URL: $inventory_api_url_base64|g" Manifests/api-gateway/api-gateway-secret.yaml

    echo "api-gateway-secret.yaml updated with new Inventory API URL"
}
