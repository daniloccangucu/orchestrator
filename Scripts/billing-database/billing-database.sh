#!/bin/bash
set -e

apply_billingdatabase_manifest() {
    #!/bin/bash
    set -e

    echo "Creating billing-database ConfigMap..."
    kubectl create configmap billing-database-config --from-file=./Scripts/billing-database/0-billing-setup.sql --from-file=./Scripts/billing-database/1-configure-postgres.sh --dry-run=client -o yaml > ./Manifests/billing-database/billing-database-config.yaml

    echo "ConfigMap generation complete."

    echo "Applying billing-database manifests..."
    kubectl apply -f ./Manifests/billing-database/
}
