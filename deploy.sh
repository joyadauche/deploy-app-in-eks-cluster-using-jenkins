#!/bin/bash

sed -i "s#placeholder-image#${imageName}#g" k8s-deployment-service.yaml
kubectl -n default apply -f k8s-deployment-service.yaml