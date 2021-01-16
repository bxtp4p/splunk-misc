#!/bin/bash

SFX_REALM=${REALM:=us0}

docker run -d \
    -p 9080:9080 \
    --name signalfx-agent \
    --hostname ${HOSTNAME} \
    -v /:/hostfs:ro \
    -v /var/run/docker.sock:/var/run/docker.sock:ro \
    -v /etc/passwd:/etc/passwd:ro \
    -e SFX_ACCESS_TOKEN=${ACCESS_TOKEN} \
    -e SFX_INGEST_URL="https://ingest.${SFX_REALM}.signalfx.com" \
    -e SFX_API_URL="https://api.${SFX_REALM}.signalfx.com" \
    -e SFX_TRACE_ENDPOINT_URL="https://ingest.us1.signalfx.com/v2/trace" \
    quay.io/signalfx/signalfx-agent:${AGENT_VERSION:=5.7.1}