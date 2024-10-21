apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"rbac.authorization.k8s.io/v1","kind":"ClusterRoleBinding","metadata":{"annotations":{},"labels":{"app":"kiali","app.kubernetes.io/instance":"istio","app.kubernetes.io/managed-by":"Helm","app.kubernetes.io/name":"kiali","app.kubernetes.io/part-of":"kiali","app.kubernetes.io/version":"v1.87.0","helm.sh/chart":"kiali-server-1.87.0","version":"v1.87.0"},"name":"kiali"},"roleRef":{"apiGroup":"rbac.authorization.k8s.io","kind":"ClusterRole","name":"kiali"},"subjects":[{"kind":"ServiceAccount","name":"kiali","namespace":"istio-system"}]}
  creationTimestamp: "2024-10-18T20:11:40Z"
  labels:
    app: kiali
    app.kubernetes.io/instance: istio
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/name: kiali
    app.kubernetes.io/part-of: kiali
    app.kubernetes.io/version: v1.87.0
    helm.sh/chart: kiali-server-1.87.0
    version: v1.87.0
  name: kiali
  resourceVersion: "4644516"
  uid: 9c527c2c-05e3-436f-abbf-28dc40020fdb
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: kiali
