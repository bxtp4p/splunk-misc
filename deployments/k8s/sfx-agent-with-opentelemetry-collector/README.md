# SFX Agent and OpenTelemetry Collector

Deploy SFX Agent and OpenTelemetry Collector to Kubernetes.

## Steps


1. Export environment variables

```
export ACCESS_TOKEN=[YOUR ACCESS TOKEN]
export REALM=[YOUR ORG REALM]
export CLUSTER_NAME=[NAME YOUR CLUSTER]

```

2. Create a secret for your access token

```
kubectl create secret generic sfx-token-and-realm --from-literal=access_token='${ACCESS_TOKEN}' --from-liter=realm='${REALM}'
```

3. Deploy the Smart Agent

```
helm install -f values-otel.yaml \
  --set clusterName=${CLUSTER_NAME} \
  --set signalFxAccessToken=${ACCESS_TOKEN} \
  --set signalFxRealm=${REALM} \
 signalfx-agent signalfx/signalfx-agent
```
