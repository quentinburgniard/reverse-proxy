# reverse-proxy
## Quick Start
### 1. Create secret
`kubectl create secret generic env --from-env-file=.env --dry-run=client -o yaml | kubectl apply -f -`
