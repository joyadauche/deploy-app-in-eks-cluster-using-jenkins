#!/bin/bash

sed -i "s#placeholder-image#${imageName}#g" ./kube-manifests/k8s-deployment-service.yaml
kubectl -n default apply -f ./kube-manifests/