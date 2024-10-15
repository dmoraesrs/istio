kubectl create configmap hosts-config --from-literal=hostsfile="172.192.72.22 nginx.plataformammais-sandbox.n-mercantil.com.br"


apiVersion: v1
kind: Pod
metadata:
  name: busybox-hosts
spec:
  hostAliases:
  - ip: "172.192.72.22"
    hostnames:
    - "nginx.plataformammais-sandbox.n-mercantil.com.br"
  containers:
  - name: busybox
    image: busybox
    command: ['sh', '-c', 'cat /etc/hosts && sleep 3600']  # Exibe o conteúdo do arquivo /etc/hosts e mantém o pod rodando
  restartPolicy: Never
