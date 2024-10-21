apiVersion: v1
kind: Service
metadata:
  annotations:
    cloud.google.com/load-balancer-type: Internal
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"v1","kind":"Service","metadata":{"annotations":{"cloud.google.com/load-balancer-type":"Internal","networking.gke.io/internal-load-balancer-allow-global-access":"true"},"labels":{"app":"istio-ingressgateway","install.operator.istio.io/owning-resource":"unknown","istio":"ingressgateway","istio.io/rev":"default","operator.istio.io/component":"IngressGateways","release":"istio-ingress"},"name":"istio-ingressgateway","namespace":"istio-system"},"spec":{"loadBalancerIP":"10.192.72.24","ports":[{"name":"status-port","port":15021,"protocol":"TCP","targetPort":15021},{"name":"http2","port":80,"protocol":"TCP","targetPort":8080},{"name":"https","port":443,"protocol":"TCP","targetPort":8443}],"selector":{"app":"istio-ingressgateway","istio":"ingressgateway"},"type":"LoadBalancer"}}
    networking.gke.io/internal-load-balancer-allow-global-access: "true"
  creationTimestamp: "2024-10-21T18:00:16Z"
  finalizers:
  - service.kubernetes.io/load-balancer-cleanup
  - gke.networking.io/l4-ilb-v1
  labels:
    app: istio-ingressgateway
    install.operator.istio.io/owning-resource: unknown
    istio: ingressgateway
    istio.io/rev: default
    operator.istio.io/component: IngressGateways
    release: istio-ingress
  name: istio-ingressgateway
  namespace: istio-system
  resourceVersion: "8100450"
  uid: 3c7bb34c-3a1a-45c6-90be-a56ead118995
spec:
  allocateLoadBalancerNodePorts: true
  clusterIP: 10.193.72.61
  clusterIPs:
  - 10.193.72.61
  externalTrafficPolicy: Cluster
  internalTrafficPolicy: Cluster
  ipFamilies:
  - IPv4
  ipFamilyPolicy: SingleStack
  loadBalancerIP: 10.192.72.24
  ports:
  - name: status-port
    nodePort: 31417
    port: 15021
    protocol: TCP
    targetPort: 15021
  - name: http2
    nodePort: 32646
    port: 80
    protocol: TCP
    targetPort: 8080
  - name: https
    nodePort: 32419
    port: 443
    protocol: TCP
    targetPort: 8443
  selector:
    app: istio-ingressgateway
    istio: ingressgateway
  sessionAffinity: None
  type: LoadBalancer
status:
  loadBalancer:
    ingress:
    - ip: 10.192.72.24
      ipMode: VIP
