#!/bin/bash

apply_billingdatabase_manifest() {
    echo "Applying billing-database manifests..."
    kubectl apply -f ./Manifests/billing-database/
}
