# Launch Kubernetes cluster on GCP

This repo helps you to deploy a Kubernetes cluster in GCP using a Bash script.
Cluster creation/destroy will take 4-5 minutes approximately.
The script _launch-cluster.sh_ takes one of the following arguments:

- *launch*
- *list*
- *destroy*
- *cleanup*
- *help*

## launch
When you pick the _*launch*_ option, it will create a Kuberntes cluster with 3
e2-medium machines, named _"my-test-cluster"_. You can change the name modifying
the value in the *"gcloud_cluster_name"* variable, inside of the script before
to deploy.

## list
This option presents you the running clusters *launched* using this script reading from the
~/.launch-cluster.state file.

## destroy <cluster-name>
Choosing the _*destroy*_ option, it will destroy the cluster that you pass as argument and
delete it from the ~/.launch-cluster.state file.

## cleanup
When you decide to delete all the clusters created with this script, you use this option.

## help
This will show you a brief usage of this script.

# Examples

For launching a cluster:
```console
./launch-cluster.sh launch
```

For destroying a cluster:
```console
./launch-cluster.sh destroy
```

*Any contribution is welcome!*