apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: nginx-virtualservice
  namespace: default
spec:
  hosts:
    - "nginx.example.com"  # O mesmo domínio configurado no Gateway
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
              number: 80
