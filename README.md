apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: layer
                operator: In
                values:
                - apps
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80  # Porta HTTP
        - containerPort: 443 # Porta HTTPS (mesmo que não haja terminação TLS aqui, deixe para tráfego SSL caso necessário)
---
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  selector:
    app: nginx
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
    - protocol: TCP
      port: 443
      targetPort: 443
  type: NodePort  # Pode ser LoadBalancer também, dependendo da necessidade
---
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: nginx-gateway
  namespace: default
spec:
  selector:
    istio: ingressgateway  # Seleciona o Ingress Gateway do Istio
  servers:
    - port:
        number: 80
        name: http
        protocol: HTTP
      hosts:
        - "nginx.plataformammais-sandbox.n-mercantil.com.br"  # Domínio para HTTP
    - port:
        number: 443
        name: https
        protocol: HTTPS
      tls:
        mode: SIMPLE  # Usa o certificado TLS padrão do Istio
      hosts:
        - "nginx.plataformammais-sandbox.n-mercantil.com.br"  # Domínio para HTTPS
---
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: nginx-virtualservice
  namespace: default
spec:
  hosts:
    - "nginx.plataformammais-sandbox.n-mercantil.com.br"  # O mesmo domínio configurado no Gateway
  gateways:
    - nginx-gateway
  http:
    - match:
        - uri:
            prefix: "/"  # Roteia todo o tráfego para o NGINX
      route:
        - destination:
            host: nginx-service  # O nome do Service do NGINX
            port:
              number: 80  # Roteamento para porta HTTP
    - match:
        - uri:
            prefix: "/"  # Roteia todo o tráfego para o NGINX
      route:
        - destination:
            host: nginx-service
            port:
              number: 443  # Roteamento para porta HTTPS
