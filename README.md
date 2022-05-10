# Launch Kubernetes cluster on GCP

This repo helps you to deploy a Kubernetes cluster in GCP using a Bash script.
The script _launch-cluster.sh_ takes one of two possible arguments: *launch* or *destroy*.

When you pick the _*launch*_ option, it will create a Kuberntes cluster with 3
e2-medium machines, named _"my-test-cluster"_. You can change the name modifying
the value in the *"gcloud_cluster_name"* variable, inside of the script before
to deploy.

On the other hand, if you choose the _*destroy*_ option, it will destroy the
created Kubernetes cluster using the cluster name defined in the *"gcloud_cluster_name"*
variable.

Cluster creation/destroy will take 4-5 minutes approximately.

Any contribution is welcome!

# Examples

For launching a cluster:
```console
./launch-cluster.sh launch
```

For destroying a cluster:
```console
./launch-cluster.sh destroy
```
