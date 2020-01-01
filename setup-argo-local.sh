#!/bin/bash
. create-sealed-github-secret.sh
kubectl create namespace argocd
kustomize build src/overlays/local | kubectl apply -f -
kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2
### 
# Access with port-forward using command:
# kubectl port-forward svc/argocd-server -n argocd 8001:443
# DEFAULTS:
# Username: admin
# Password: kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2
