#!/bin/bash

source Scripts/rabbitmq.sh
source Scripts/api-gateway.sh
source Scripts/billing-database.sh

# Function to create the cluster
create_cluster() {
    echo "Creating the cluster..."
    
    vagrant up

    while [ ! -f ~/k3s.yaml ]; do
        echo "Waiting for k3s.yaml file to be generated..."
        sleep 1
    done

    export KUBECONFIG=~/k3s.yaml

    apply_rabbitmq_manifest && apply_apigateway_manifest && apply_billingdatabase_manifest
    
    echo "Cluster created"
}

# Function to stop the cluster
stop_cluster() {
    echo "Stopping the cluster..."

    kubectl delete deployments --all
    kubectl delete services --all
    kubectl delete pods --all
    kubectl delete pvc --all
    kubectl delete pv --all

    vagrant halt
    
    echo "Cluster stopped"
}

# Main script
case "$1" in
    create)
        create_cluster
        ;;
    stop)
        stop_cluster
        ;;
    *)
        echo "Usage: $0 {create|stop}"
        exit 1
        ;;
esac
