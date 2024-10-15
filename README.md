apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: istio-ingressgateway
  namespace: istio-system
spec:
  selector:
    istio: ingressgateway # Seleciona o Istio ingress-gateway
  servers:
  - port:
      number: 443
      name: https
      protocol: HTTPS
    tls:
      mode: SIMPLE
      credentialName: istio-ingressgateway-certs # Nome do secret criado
    hosts:
    - "*"
---
kubectl create -n istio-system secret tls istio-ingressgateway-certs \
  --key /path/to/tls.key \
  --cert /path/to/tls.crt
