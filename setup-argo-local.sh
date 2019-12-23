kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

### 
# Access with port-forward using command:
# kubectl port-forward svc/argocd-server -n argocd 8001:443
# DEFAULTS:
# Username: admin
# Password: kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2
