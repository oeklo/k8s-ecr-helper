# Kubernetes ECR credentials helper

Runs as a pod.

Needs a ServiceAccount with Role:

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: ...
rules:
- resources:
  - secrets
  verbs:
  - create
  - get
  - patch
  apiGroups:
  - ''
  resourceNames:
  - ...
```

docker.io/oeklo/k8s-ecr-helper
