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

3. Deploy the OpenTelemetry Collector

```
kubectl apply -f otel-collectorsignalfx-k8s.yaml
```

Validate that the `otel-collector` pod has a `Running` state:

```
kubectl get pod
```

4. Deploy the Smart Agent

```
helm install -f values-otel.yaml \
  --set clusterName=${CLUSTER_NAME} \
  --set signalFxAccessToken=${ACCESS_TOKEN} \
  --set signalFxRealm=${REALM} \
  --set gatherDockerMetrics=false \
  --set kubeletAPI.url=https://localhost:10250 \
 signalfx-agent signalfx/signalfx-agent
```

Validate the `signalfx-agent` pods are in a `Running` state:

```
kubectl get pod
```