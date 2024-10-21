apiVersion: v1
kind: ServiceAccount
metadata:
  name: kiali
  namespace: istio-system
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: kiali
rules:
- apiGroups: [""]
  resources: ["pods", "services", "endpoints", "configmaps", "namespaces"]
  verbs: ["get", "list", "watch"]
- apiGroups: ["networking.istio.io", "security.istio.io", "telemetry.istio.io"]
  resources: ["*"]
  verbs: ["get", "list", "watch", "create", "delete", "patch"]
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
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: kiali
  namespace: istio-system
data:
  config.yaml: |
    istio_namespace: istio-system
    auth:
      strategy: anonymous
    deployment:
      accessible_namespaces: ['**']
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: kiali
  namespace: istio-system
spec:
  replicas: 1
  selector:
    matchLabels:
      app: kiali
  template:
    metadata:
      labels:
        app: kiali
    spec:
      serviceAccountName: kiali
      containers:
      - name: kiali
        image: quay.io/kiali/kiali:v1.87
        ports:
        - containerPort: 20001
        - containerPort: 9090
        readinessProbe:
          httpGet:
            path: /kiali/healthz
            port: 20001
        livenessProbe:
          httpGet:
            path: /kiali/healthz
            port: 20001
        resources:
          limits:
            memory: 1Gi
          requests:
            cpu: 10m
            memory: 64Mi
---
apiVersion: v1
kind: Service
metadata:
  name: kiali
  namespace: istio-system
spec:
  ports:
  - name: http
    port: 20001
  - name: http-metrics
    port: 9090
  selector:
    app: kiali
---
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: kiali
  namespace: istio-system
spec:
  hosts:
  - "kiali.example.com"  # Substitua pelo seu domínio
  gateways:
  - istio-system/istio-ingressgateway
  http:
  - match:
      - uri:
          prefix: "/"
    route:
    - destination:
        host: kiali
        port:
          number: 20001
---
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: kiali-metrics
  namespace: istio-system
spec:
  hosts:
  - "kiali-metrics.example.com"  # Substitua pelo seu domínio
  gateways:
  - istio-system/istio-ingressgateway
  http:
  - match:
      - uri:
          prefix: "/"
    route:
    - destination:
        host: kiali
        port:
          number: 9090
