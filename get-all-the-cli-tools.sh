#!/bin/bash

## Docker - If not installed
command -v docker > /dev/null 2>&1 || {
   echo "Installing Docker"
   sudo apt-get update
   sudo apt-get install \
      apt-transport-https \
      ca-certificates \
      curl \
      gnupg-agent \
      software-properties-common
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   sudo add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) \
      stable"
   sudo apt-get update
   sudo apt-get install docker-ce docker-ce-cli containerd.io
}

command -v docker version > /dev/null 2>&1 || {
   echo "Failed to install docker"
}

## Kubectl
command -v kubectl > /dev/null 2>&1 || {
   echo "Installing Kubectl"
   curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
   chmod +x ./kubectl
   sudo mv ./kubectl /usr/local/bin/kubectl
}

command -v kubectl version > /dev/null 2>&1 || {
   echo "Failed to install kubectl"
}

## Istioctl
command -v istioctl > /dev/null 2>&1 || {
   echo "Installing istioctl"
   curl -L https://github.com/istio/istio/releases/download/1.4.2/istioctl-1.4.2-linux.tar.gz --output istioctl.tar.gz
   tar -xzvf istioctl.tar.gz
   chmod +x ./istioctl
   sudo mv ./istioctl /usr/local/bin/istioctl
   rm -f istioctl.tar.gz
}

command -v istioctl version > /dev/null 2>&1 || {
   echo "Failed to install istioctl"
}

## Argo
command -v argocd version > /dev/null 2>&1 || {
   echo "Installing argocd CLI"
   curl -L https://github.com/argoproj/argo-cd/releases/download/v1.3.6/argocd-linux-amd64 --output argocd
   chmod +x argocd
   sudo mv ./argocd /usr/local/bin/argocd
}

command -v argocd version > /dev/null 2>&1 || {
   echo "Failed to install argocd"
}

## Kustomize
command -v kustomize version > /dev/null 2>&1 || {
   echo "Installing kustomize"
   curl -L https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv3.5.3/kustomize_v3.5.3_linux_amd64.tar.gz --output kustomize.tar.gz
   tar -xzvf kustomize.tar.gz
   chmod +x kustomize
   sudo mv ./kustomize /usr/local/bin/kustomize
   rm -f kustomize.tar.gz
}

command -v kustomize version > /dev/null 2>&1 || {
   echo "Failed to install kustomize"
}

## Kubeseal
command -v kubeseal > /dev/null 2>&1 || {
   echo "Installing kubeseal"
   curl -L https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.9.6/kubeseal-linux-amd64 --output kubeseal
   chmod +x kubeseal
   sudo mv ./kubeseal /usr/local/bin/kubeseal
}

command -v kubeseal > /dev/null 2>&1 || {
   echo "Failed installing kubeseal"
}