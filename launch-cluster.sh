#!/usr/bin/bash

# Take arguments
gcloud_cluster_name="my-test-cluster"
gcloud_region="us-east1"
gcloud_zone="us-east-1-b"

# Launch cluster
function launch_cluster() {
    
    gcloud container clusters create $gcloud_cluster_name \
        --region $gcloud_region \
        --zone $gcloud_zone \
        --name $gcloud_cluster_name \
        --preemptible

}

# Destroy cluster
function destroy_cluster() {
    
    gcloud container clusters delete $gcloud_cluster_name \
        --region $gcloud_region \
        --zone $gcloud_zone \
        --name $gcloud_cluster_name

}

case $1 in
    launch)
        launch_cluster
        ;;
    destroy)
        destroy_cluster
        ;;
    *)
        echo "Unkonw option. Please use 'launch' or 'destroy' as parameters."
        ;;
esac