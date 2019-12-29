#!/bin/bash

if [ "$USER" != "ntop" ]
then
    echo "Only works on my machine :)"
    exit 1
fi

GITHUBKEY_LOCATION="/home/ntop/.ssh/github"
SEALEDSECRET_LOCATION="/home/ntop/projects/argocd-setup/argo-cd/base/resources/github-secret-sealed.json"
UNSEALEDSECRET_NAME="github-secret"
SEALEDSECRET_NAME="github-secret-sealed.json"

kubectl create secret generic $UNSEALEDSECRET_NAME -n "argocd" --dry-run --from-file=github_personal="$GITHUBKEY_LOCATION" -o json | kubeseal > $SEALEDSECRET_NAME
rm -f $SEALEDSECRET_LOCATION
rm -f $UNSEALEDSECRET_NAME
mv $SEALEDSECRET_NAME $SEALEDSECRET_LOCATION