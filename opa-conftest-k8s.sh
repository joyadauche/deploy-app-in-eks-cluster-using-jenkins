docker run --rm -v $(pwd):/project openpolicyagent/conftest test --policy opa-k8s-security.rego kube-manifests/k8s-deployment-service.yaml