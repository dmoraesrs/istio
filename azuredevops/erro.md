apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: kiali
  labels:
    app: kiali
    app.kubernetes.io/name: kiali
rules:
  - apiGroups:
      - ""
    resources:
      - namespaces
      - pods
      - services
      - endpoints
    verbs:
      - get
      - list
      - watch
  - apiGroups:
      - networking.istio.io
    resources:
      - virtualservices
      - gateways
      - destinationrules
      - sidecars
      - serviceentries
    verbs:
      - get
      - list
      - watch
  - apiGroups:
      - security.istio.io
    resources:
      - peerauthentications
      - authorizationpolicies
      - requestauthentications
    verbs:
      - get
      - list
      - watch
  - apiGroups:
      - telemetry.istio.io
    resources:
      - telemetries
    verbs:
      - get
      - list
      - watch
  - apiGroups:
      - extensions.istio.io
    resources:
      - wasmplugins
    verbs:
      - get
      - list
      - watch
  - apiGroups:
      - ""
    resources:
      - configmaps
    verbs:
      - get
      - list
  - apiGroups:
      - rbac.authorization.k8s.io
    resources:
      - roles
      - rolebindings
      - clusterroles
      - clusterrolebindings
    verbs:
      - get
      - list
      - watch

---

apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: kiali
  labels:
    app: kiali
    app.kubernetes.io/instance: istio
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/name: kiali
    app.kubernetes.io/part-of: kiali
    app.kubernetes.io/version: v1.87.0
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: kiali
subjects:
  - kind: ServiceAccount
    name: kiali
    namespace: istio-system
