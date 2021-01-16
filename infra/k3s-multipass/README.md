# k3s on Multipass

Instructions for creating a k3s cluster on Multipass.

## Create and Configure Master Node

Create the master node with Multipass:

```
export K3S_MASTER_NAME=k3s-master && \
multipass launch --name ${K3S_MASTER_NAME} --cpus 4 --mem 4096M --disk 20G
```

> Note: Adjust these specs per your requirements.


Install k3s:

```
multipass exec ${K3S_MASTER_NAME} -- /bin/bash -c "curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" sh -"
```

Get the IP of the master node:

```
export K3S_MASTER_IP=$(multipass list | awk -v master=$K3S_MASTER_NAME '$1==master { print $3 }') && echo ${K3S_MASTER_IP}
```

Get the join token:

```
export K3S_TOKEN=$(multipass exec ${K3S_MASTER_NAME} -- sudo cat /var/lib/rancher/k3s/server/node-token) && echo ${K3S_TOKEN}
```

## Create and Configure a Worker Node

Create the worker node with multipass.

```
export K3S_NODE_NAME=k3s-node-1 && \
multipass launch --name ${K3S_NODE_NAME} --cpus 4 --mem 4096M --disk 20G
```

> Note: Adjust these specs per your requirements.

Join the worker node to the Kubernetes cluster:

```
multipass exec ${K3S_NODE_NAME} -- /bin/bash -c "curl -sfL https://get.k3s.io | K3S_TOKEN=${K3S_TOKEN} K3S_URL=https://${K3S_MASTER_IP}:6443 sh -"
```

Validate that your nodes have a status of `Ready`:

```
multipass exec ${K3S_MASTER_NAME} -- sudo kubectl get node
```