#!/bin/bash

source Scripts/rabbitmq.sh
source Scripts/api-gateway.sh

# Function to create the cluster
create_cluster() {
    echo "Creating the cluster..."
    vagrant up
    export KUBECONFIG=~/k3s.yaml
    apply_rabbitmq_manifest && apply_apigateway_manifest
    echo "Cluster created"
}

# Function to stop the cluster
stop_cluster() {
    echo "Stopping the cluster..."
    kubectl delete deployments --all
    kubectl delete services --all
    kubectl delete pods --all
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
        echo "Usage: $0 {create|stop|}"
        exit 1
esac
