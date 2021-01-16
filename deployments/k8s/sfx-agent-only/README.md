# SFX Agent 

Deploy SFX Agent to Kubernetes.

## Steps

1. Export environment variables

```
export ACCESS_TOKEN=[YOUR ACCESS TOKEN]
export REALM=[YOUR ORG REALM]
export CLUSTER_NAME=[NAME YOUR CLUSTER]

```

2. Deploy the Smart Agent with Helm

Make sure you have [Helm](https://helm.sh/) installed.

```
helm install -f values.yaml \
  --set clusterName=${CLUSTER_NAME} \
  --set signalFxAccessToken=${ACCESS_TOKEN} \
  --set signalFxRealm=${REALM} \
  --set traceEndpointUrl="https://ingest.${REALM}.signalfx.com/v2/trace"
  signalfx-agent signalfx/signalfx-agent
```

Other chart values can be found [here](https://github.com/signalfx/signalfx-agent/blob/master/deployments/k8s/helm/signalfx-agent/values.yaml).