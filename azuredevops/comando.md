kubectl auth can-i list virtualservices.networking.istio.io --as=system:serviceaccount:istio-system:kiali -n istio-system




apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: kiali
rules:
  - apiGroups:
      - "networking.istio.io"
    resources:
      - virtualservices
      - destinationrules
      - gateways
      - sidecars
      - serviceentries
      - workloadentries
      - workloadgroups
    verbs: ["get", "list", "watch"]
  - apiGroups:
      - "telemetry.istio.io"
    resources:
      - telemetries
    verbs: ["get", "list", "watch"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: kiali
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: kiali
subjects:
  - kind: ServiceAccount
    name: kiali
    namespace: istio-system
