# reverse-proxy

## Quick Start

### 1. Prepare local env files

`cp .env.example .env`

`cp .conf.example .conf`

### 2. Create secret

`kubectl create secret generic env --from-env-file=.env --dry-run=client -o yaml | kubectl apply -f -`

### 3. Create secret

`kubectl create secret generic internal-auth --from-file=auth=.htpasswd --dry-run=client -o yaml | kubectl apply -f -`

### 4. Create config

`kubectl create configmap env --from-env-file=.conf --dry-run=client -o yaml | kubectl apply -f -`

## Deploy to cluster

### 1. Validate manifest

#### Local

`kubectl apply --dry-run=client -f ./common -f ./local`

#### Prod

`kubectl apply --dry-run=client -f ./common -f ./prod`

### 2. Deploy to cluster

#### Local

`kubectl apply -f ./common -f ./local`

#### Prod

`kubectl apply -f ./common -f ./prod`
