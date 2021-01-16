# Docker

Various scripts/configs/etc for Docker.

## run-sfx-smart-agent.sh

Runs the SFX Smart Agent in a container.

Environment Variable | Description       | Required | Default
-------------------- | ------------------| -------- | ----------
ACCESS_TOKEN         | SFX access token  | Yes      | none   
REALM                | SFX realm         | No       | us0 
HOSTNAME             |The hostname to report under | Yes | none
AGENT_VERSION        | The version of the agent to run. See [tags](https://quay.io/repository/signalfx/signalfx-agent?tag=latest&tab=tags). | No | 5.7.1
