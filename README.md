# A rust builder container for Jenkins

## To run:
Craate a node in jenkins, then run:

```shell
podman run -d \
  --name rust-builder \
  -e JENKINS_URL=http://jenkins:8080 \
  -e JENKINS_AGENT_NAME=rust-builder \
  -e JENKINS_SECRET=<secret> \
  -v rust-agent-work:/home/jenkins/agent \
  --network jenkins-net \
  --replace \
  docker.io/maciekw/rust-jenkins-builder:latest
```

You defenitely must update `JENKINS_SECRET`. `JENKINS_AGENT_NAME` must be match the name definde in your jenkins.
The address in URL need to be resolvable and reachable from the node.
It creates a permanent volume which gives hope that the precious cache won't be lost with container recreate.
