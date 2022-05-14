#!/bin/bash

set -e

# Set values
gcloud_cluster_name="my-test-cluster-"$RANDOM
gcloud_zone="us-east1-b"
cluster_state_file=~/.launch-cluster.state


# Launch cluster
function launch_cluster() {
    echo
    echo "Deploying your cluster 🚀. Go for a drink 🍼, make some stretching 🏃 and come back here, just 5 minutes!"
    echo
    # Save cluster name into a state file
    echo $gcloud_cluster_name >> $cluster_state_file
    gcloud container clusters create $gcloud_cluster_name \
        --zone $gcloud_zone \
        --quiet \
        --preemptible
    echo
    echo "Cluster creation is done."
    echo
    echo "To delete the cluster, pass the cluster name to this script using the 'destroy' parameter."
    echo "Cluster Name: $gcloud_cluster_name"
    echo
    echo "Your current clusters:"
    cat $cluster_state_file
}

# List clusters deployed using this tool
function list_clusters() {
    cat $cluster_state_file
}

# Destroy cluster
function destroy_cluster() {
    echo
    echo "Destroying cluster..."
    echo
    gcloud container clusters delete $1 \
        --zone $gcloud_zone
    sed -i '' "/$1/d" $cluster_state_file
    echo
    echo "Cluster deleted and removed from the state file!"
    echo
}

function cleanup() {
    echo
    echo "🧹 You will clean up the entire resources deployed using this script."
    echo "The following are the clusters that will be deleted:"
    cat $cluster_state_file
    echo
    number_of_clusters=$(sed -n '$=' $cluster_state_file)
    cat $cluster_state_file | xargs -n 1 -P $number_of_clusters gcloud container clusters delete --zone $gcloud_zone --quiet
    rm -rf $cluster_state_file
    echo
    echo "Your resources has been deleted 💥"
    echo
}

function usage() {
    echo
    echo "Usage:"
    echo
    echo "$0 <OPTION> <CLUSTER-NAME (If applicable)>"
    echo
    echo "Options:"
    echo
    echo "  launch                         Launch a GCP standard Kubernetes cluster."
    echo
    echo "  list                           Reads from the state file ($cluster_state_file) current "
    echo "                                 deployed clusters using this script."
    echo
    echo "  destroy <cluster-name>         Destroy a cluster passing the name."
    echo
    echo "  cleanup                        Destroy all clusters and the state file."
    echo
    echo "  help                           Print this help."
    echo
}

case $1 in
    launch)
        launch_cluster
        ;;
    list)
        list_clusters
        ;;
    destroy)
        destroy_cluster $2
        ;;
    cleanup)
        cleanup
        ;;
    help)
        usage
        ;;
    *)
        echo "Unknown option."
        usage
        ;;
esac