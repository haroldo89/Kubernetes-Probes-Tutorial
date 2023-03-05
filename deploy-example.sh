#!/bin/sh
set -o errexit

# create a new cluster with local repository
./cluster-test.sh

# build the docker image
docker build -t note-sample-app:1

# push the docker image
docker push note-sample-app:1

# apply manifest inside the cluster
kubectl apply -f deployment.yaml

# get all objects inside the cluster in the target namespace
kubectl get all