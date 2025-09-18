# reverse-proxy
## Quick Start
### 1. Create secret
`kubectl create secret generic env --from-env-file=.env --dry-run=client -o yaml | kubectl apply -f -`
### 2. Create config
`kubectl create configmap env --from-env-file=.config --dry-run=client -o yaml | kubectl apply -f -`
## Deploy to cluster
### 1. Validate manifest
`kubectl apply --dry-run=client -f ./k8s`
### 2. Deploy to cluster
`kubectl apply -f ./k8s`