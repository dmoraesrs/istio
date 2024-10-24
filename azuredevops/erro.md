Name:             prometheus-prometheus-kube-prometheus-prometheus-0
Namespace:        observabilidade
Priority:         0
Service Account:  prometheus-kube-prometheus-prometheus
Node:             gke-gke-cluster-sandbox-platafo-apps2-819f5cca-pkdg/10.192.72.29
Start Time:       Thu, 24 Oct 2024 11:55:38 +0000
Labels:           app.kubernetes.io/component=prometheus
                  app.kubernetes.io/instance=prometheus-kube-prometheus-prometheus
                  app.kubernetes.io/managed-by=prometheus-operator
                  app.kubernetes.io/name=prometheus
                  app.kubernetes.io/version=2.54.1
                  apps.kubernetes.io/pod-index=0
                  controller-revision-hash=prometheus-prometheus-kube-prometheus-prometheus-77499c9c8d
                  operator.prometheus.io/name=prometheus-kube-prometheus-prometheus
                  operator.prometheus.io/shard=0
                  prometheus=prometheus-kube-prometheus-prometheus
                  security.istio.io/tlsMode=istio
                  service.istio.io/canonical-name=prometheus
                  service.istio.io/canonical-revision=2.54.1
                  statefulset.kubernetes.io/pod-name=prometheus-prometheus-kube-prometheus-prometheus-0
Annotations:      istio.io/rev: default
                  kubectl.kubernetes.io/default-container: prometheus
                  kubectl.kubernetes.io/default-logs-container: prometheus
                  prometheus.io/path: /stats/prometheus
                  prometheus.io/port: 15020
                  prometheus.io/scrape: true
                  sidecar.istio.io/status:
                    {"initContainers":["istio-init"],"containers":["istio-proxy"],"volumes":["workload-socket","credential-socket","workload-certs","istio-env...
Status:           Running
IP:               100.96.36.9
IPs:
  IP:           100.96.36.9
Controlled By:  StatefulSet/prometheus-prometheus-kube-prometheus-prometheus
Init Containers:
  init-config-reloader:
    Container ID:  containerd://31c0a1369bba3e35156535fc1a0f88aff2ba492bc115c8a4b17999d6ce25e71c
    Image:         docker.io/bitnami/prometheus-operator:0.77.1-debian-12-r1
    Image ID:      docker.io/bitnami/prometheus-operator@sha256:7a6fe2307fdfaee19c7f8dc5264cd5cf0786f9042fd850c25b3f21837f800db1
    Port:          8081/TCP
    Host Port:     0/TCP
    Command:
      /bin/prometheus-config-reloader
    Args:
      --watch-interval=0
      --listen-address=:8081
      --config-file=/etc/prometheus/config/prometheus.yaml.gz
      --config-envsubst-file=/etc/prometheus/config_out/prometheus.env.yaml
      --watched-dir=/etc/prometheus/rules/prometheus-prometheus-kube-prometheus-prometheus-rulefiles-0
    State:          Terminated
      Reason:       Completed
      Exit Code:    0
      Started:      Thu, 24 Oct 2024 11:55:46 +0000
      Finished:     Thu, 24 Oct 2024 11:55:53 +0000
    Ready:          True
    Restart Count:  0
    Limits:
      cpu:     10m
      memory:  50Mi
    Requests:
      cpu:     10m
      memory:  50Mi
    Environment:
      POD_NAME:  prometheus-prometheus-kube-prometheus-prometheus-0 (v1:metadata.name)
      SHARD:     0
    Mounts:
      /etc/prometheus/config from config (rw)
      /etc/prometheus/config_out from config-out (rw)
      /etc/prometheus/rules/prometheus-prometheus-kube-prometheus-prometheus-rulefiles-0 from prometheus-prometheus-kube-prometheus-prometheus-rulefiles-0 (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-fkqgc (ro)
  istio-init:
    Container ID:  containerd://54153b7fdc4ba89c43390b9f3959e96719108e034e44c4faef7feaf7e8558c41
    Image:         gcr.io/istio-testing/proxyv2:latest
    Image ID:      gcr.io/istio-testing/proxyv2@sha256:35ecfd7ee4363f168c8187affcb03243ca3f6b75c03dd2d3ee169ecd8b9c8f2c
    Port:          <none>
    Host Port:     <none>
    Args:
      istio-iptables
      -p
      15001
      -z
      15006
      -u
      1337
      -m
      REDIRECT
      -i
      *
      -x
      
      -b
      *
      -d
      15090,15021,15020
      --log_output_level=default:info
    State:          Terminated
      Reason:       Completed
      Exit Code:    0
      Started:      Thu, 24 Oct 2024 11:56:00 +0000
      Finished:     Thu, 24 Oct 2024 11:56:00 +0000
    Ready:          True
    Restart Count:  0
    Limits:
      cpu:     2
      memory:  1Gi
    Requests:
      cpu:        100m
      memory:     128Mi
    Environment:  <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-fkqgc (ro)
Containers:
  prometheus:
    Container ID:    containerd://f9be1ea03e25681d29a3239eac13952aa5e158f1a9c16b5afccace7108d344c1
    Image:           docker.io/bitnami/prometheus:2.54.1-debian-12-r4
    Image ID:        docker.io/bitnami/prometheus@sha256:08b1b7cb6a5b0c84cf3b98bf50ebfb248ab21da3514b4464274ecf6fd8481f38
    Port:            9090/TCP
    Host Port:       0/TCP
    SeccompProfile:  RuntimeDefault
    Args:
      --web.console.templates=/etc/prometheus/consoles
      --web.console.libraries=/etc/prometheus/console_libraries
      --config.file=/etc/prometheus/config_out/prometheus.env.yaml
      --web.enable-lifecycle
      --web.external-url=http://prometheus-kube-prometheus-prometheus.observabilidade:9090/
      --web.route-prefix=/
      --storage.tsdb.retention.time=10d
      --storage.tsdb.path=/prometheus
      --web.config.file=/etc/prometheus/web_config/web-config.yaml
    State:       Running
      Started:   Thu, 24 Oct 2024 13:04:54 +0000
    Last State:  Terminated
      Reason:    OOMKilled
      Message:   duration=0s mmap_chunk_replay_duration=492.043589ms total_replay_duration=52.391870964s
ts=2024-10-24T13:01:36.423Z caller=main.go:1181 level=info fs_type=EXT4_SUPER_MAGIC
ts=2024-10-24T13:01:36.423Z caller=main.go:1184 level=info msg="TSDB started"
ts=2024-10-24T13:01:36.423Z caller=main.go:1367 level=info msg="Loading configuration file" filename=/etc/prometheus/config_out/prometheus.env.yaml
ts=2024-10-24T13:01:36.518Z caller=kubernetes.go:331 level=info component="discovery manager scrape" discovery=kubernetes config=serviceMonitor/observabilidade/prometheus-kube-prometheus-apiserver/0 msg="Using pod service account via in-cluster config"
ts=2024-10-24T13:01:36.519Z caller=kubernetes.go:331 level=info component="discovery manager scrape" discovery=kubernetes config=serviceMonitor/observabilidade/prometheus-kube-prometheus-coredns/0 msg="Using pod service account via in-cluster config"
ts=2024-10-24T13:01:36.519Z caller=kubernetes.go:331 level=info component="discovery manager scrape" discovery=kubernetes config=serviceMonitor/observabilidade/prometheus-kube-prometheus-prometheus/0 msg="Using pod service account via in-cluster config"
ts=2024-10-24T13:01:36.520Z caller=kubernetes.go:331 level=info component="discovery manager notify" discovery=kubernetes config=config-0 msg="Using pod service account via in-cluster config"
ts=2024-10-24T13:01:36.520Z caller=main.go:1404 level=info msg="updated GOGC" old=100 new=75
ts=2024-10-24T13:01:36.615Z caller=main.go:1415 level=info msg="Completed loading of configuration file" filename=/etc/prometheus/config_out/prometheus.env.yaml totalDuration=191.651075ms db_storage=2.302µs remote_storage=2.011µs web_handler=951ns query_engine=29.518µs scrape=408.865µs scrape_sd=1.589898ms notify=38.375µs notify_sd=469.361µs rules=149.987µs tracing=7.122µs
ts=2024-10-24T13:01:36.616Z caller=main.go:1145 level=info msg="Server is ready to receive web requests."
ts=2024-10-24T13:01:36.617Z caller=manager.go:164 level=info component="rule manager" msg="Starting rule manager..."

      Exit Code:    137
      Started:      Thu, 24 Oct 2024 13:00:43 +0000
      Finished:     Thu, 24 Oct 2024 13:04:22 +0000
    Ready:          True
    Restart Count:  3
    Limits:
      cpu:     200m
      memory:  512Mi
    Requests:
      cpu:        100m
      memory:     256Mi
    Liveness:     http-get http://:15020/app-health/prometheus/livez delay=0s timeout=3s period=10s #success=1 #failure=10
    Readiness:    http-get http://:15020/app-health/prometheus/readyz delay=0s timeout=3s period=10s #success=1 #failure=10
    Startup:      http-get http://:15020/app-health/prometheus/startupz delay=0s timeout=3s period=15s #success=1 #failure=60
    Environment:  <none>
    Mounts:
      /etc/prometheus/certs from tls-assets (ro)
      /etc/prometheus/config_out from config-out (ro)
      /etc/prometheus/rules/prometheus-prometheus-kube-prometheus-prometheus-rulefiles-0 from prometheus-prometheus-kube-prometheus-prometheus-rulefiles-0 (rw)
      /etc/prometheus/web_config/web-config.yaml from web-config (ro,path="web-config.yaml")
      /prometheus from prometheus-prometheus-kube-prometheus-prometheus-db (rw)
      /tmp from empty-dir (rw,path="tmp-dir")
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-fkqgc (ro)
  config-reloader:
    Container ID:    containerd://52d4ad9dae99048b50c243f0529c5b8d6af6fdd13f8b692dc73a97703cf665b3
    Image:           docker.io/bitnami/prometheus-operator:0.77.1-debian-12-r1
    Image ID:        docker.io/bitnami/prometheus-operator@sha256:7a6fe2307fdfaee19c7f8dc5264cd5cf0786f9042fd850c25b3f21837f800db1
    Port:            8080/TCP
    Host Port:       0/TCP
    SeccompProfile:  RuntimeDefault
    Command:
      /bin/prometheus-config-reloader
    Args:
      --listen-address=:8080
      --reload-url=http://127.0.0.1:9090/-/reload
      --config-file=/etc/prometheus/config/prometheus.yaml.gz
      --config-envsubst-file=/etc/prometheus/config_out/prometheus.env.yaml
      --watched-dir=/etc/prometheus/rules/prometheus-prometheus-kube-prometheus-prometheus-rulefiles-0
    State:          Running
      Started:      Thu, 24 Oct 2024 11:56:16 +0000
    Ready:          True
    Restart Count:  0
    Limits:
      cpu:     10m
      memory:  50Mi
    Requests:
      cpu:      10m
      memory:   50Mi
    Liveness:   http-get http://:15020/app-health/config-reloader/livez delay=10s timeout=5s period=10s #success=1 #failure=6
    Readiness:  http-get http://:15020/app-health/config-reloader/readyz delay=15s timeout=5s period=20s #success=1 #failure=6
    Environment:
      POD_NAME:  prometheus-prometheus-kube-prometheus-prometheus-0 (v1:metadata.name)
      SHARD:     0
    Mounts:
      /etc/prometheus/config from config (rw)
      /etc/prometheus/config_out from config-out (rw)
      /etc/prometheus/rules/prometheus-prometheus-kube-prometheus-prometheus-rulefiles-0 from prometheus-prometheus-kube-prometheus-prometheus-rulefiles-0 (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-fkqgc (ro)
  istio-proxy:
    Container ID:  containerd://2f0f509a512930c1e888c5928d6d3fc2e5e386227b80660277b62a10169b9c47
    Image:         gcr.io/istio-testing/proxyv2:latest
    Image ID:      gcr.io/istio-testing/proxyv2@sha256:35ecfd7ee4363f168c8187affcb03243ca3f6b75c03dd2d3ee169ecd8b9c8f2c
    Port:          15090/TCP
    Host Port:     0/TCP
    Args:
      proxy
      sidecar
      --domain
      $(POD_NAMESPACE).svc.cluster.local
      --proxyLogLevel=warning
      --proxyComponentLogLevel=misc:error
      --log_output_level=default:info
    State:          Running
      Started:      Thu, 24 Oct 2024 11:56:17 +0000
    Ready:          True
    Restart Count:  0
    Limits:
      cpu:     2
      memory:  1Gi
    Requests:
      cpu:      100m
      memory:   128Mi
    Readiness:  http-get http://:15021/healthz/ready delay=0s timeout=3s period=15s #success=1 #failure=4
    Startup:    http-get http://:15021/healthz/ready delay=0s timeout=3s period=1s #success=1 #failure=600
    Environment:
      PILOT_CERT_PROVIDER:           istiod
      CA_ADDR:                       istiod.istio-system.svc:15012
      POD_NAME:                      prometheus-prometheus-kube-prometheus-prometheus-0 (v1:metadata.name)
      POD_NAMESPACE:                 observabilidade (v1:metadata.namespace)
      INSTANCE_IP:                    (v1:status.podIP)
      SERVICE_ACCOUNT:                (v1:spec.serviceAccountName)
      HOST_IP:                        (v1:status.hostIP)
      ISTIO_CPU_LIMIT:               2 (limits.cpu)
      PROXY_CONFIG:                  {}
                                     
      ISTIO_META_POD_PORTS:          [
                                         {"name":"web","containerPort":9090,"protocol":"TCP"}
                                         ,{"name":"reloader-web","containerPort":8080,"protocol":"TCP"}
                                     ]
      ISTIO_META_APP_CONTAINERS:     prometheus,config-reloader
      GOMEMLIMIT:                    1073741824 (limits.memory)
      GOMAXPROCS:                    2 (limits.cpu)
      ISTIO_META_CLUSTER_ID:         Kubernetes
      ISTIO_META_NODE_NAME:           (v1:spec.nodeName)
      ISTIO_META_INTERCEPTION_MODE:  REDIRECT
      ISTIO_META_WORKLOAD_NAME:      prometheus-prometheus-kube-prometheus-prometheus
      ISTIO_META_OWNER:              kubernetes://apis/apps/v1/namespaces/observabilidade/statefulsets/prometheus-prometheus-kube-prometheus-prometheus
      ISTIO_META_MESH_ID:            cluster.local
      TRUST_DOMAIN:                  cluster.local
      ISTIO_KUBE_APP_PROBERS:        {"/app-health/config-reloader/livez":{"tcpSocket":{"port":8080},"timeoutSeconds":5},"/app-health/config-reloader/readyz":{"tcpSocket":{"port":8080},"timeoutSeconds":5},"/app-health/prometheus/livez":{"httpGet":{"path":"/-/healthy","port":9090,"scheme":"HTTP"},"timeoutSeconds":3},"/app-health/prometheus/readyz":{"httpGet":{"path":"/-/ready","port":9090,"scheme":"HTTP"},"timeoutSeconds":3},"/app-health/prometheus/startupz":{"httpGet":{"path":"/-/ready","port":9090,"scheme":"HTTP"},"timeoutSeconds":3}}
    Mounts:
      /etc/istio/pod from istio-podinfo (rw)
      /etc/istio/proxy from istio-envoy (rw)
      /var/lib/istio/data from istio-data (rw)
      /var/run/secrets/credential-uds from credential-socket (rw)
      /var/run/secrets/istio from istiod-ca-cert (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-fkqgc (ro)
      /var/run/secrets/tokens from istio-token (rw)
      /var/run/secrets/workload-spiffe-credentials from workload-certs (rw)
      /var/run/secrets/workload-spiffe-uds from workload-socket (rw)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  workload-socket:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
  credential-socket:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
  workload-certs:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
  istio-envoy:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     Memory
    SizeLimit:  <unset>
  istio-data:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
  istio-podinfo:
    Type:  DownwardAPI (a volume populated by information about the pod)
    Items:
      metadata.labels -> labels
      metadata.annotations -> annotations
  istio-token:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  43200
  istiod-ca-cert:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      istio-ca-root-cert
    Optional:  false
  config:
    Type:        Secret (a volume populated by a Secret)
    SecretName:  prometheus-prometheus-kube-prometheus-prometheus
    Optional:    false
  tls-assets:
    Type:                Projected (a volume that contains injected data from multiple sources)
    SecretName:          prometheus-prometheus-kube-prometheus-prometheus-tls-assets-0
    SecretOptionalName:  <nil>
  config-out:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     Memory
    SizeLimit:  <unset>
  prometheus-prometheus-kube-prometheus-prometheus-rulefiles-0:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      prometheus-prometheus-kube-prometheus-prometheus-rulefiles-0
    Optional:  false
  web-config:
    Type:        Secret (a volume populated by a Secret)
    SecretName:  prometheus-prometheus-kube-prometheus-prometheus-web-config
    Optional:    false
  prometheus-prometheus-kube-prometheus-prometheus-db:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
  empty-dir:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
  kube-api-access-fkqgc:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   Burstable
Node-Selectors:              layer=apps
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason     Age                From     Message
  ----     ------     ----               ----     -------
  Normal   Created    21m (x3 over 85m)  kubelet  Created container prometheus
  Normal   Started    21m (x3 over 85m)  kubelet  Started container prometheus
  Normal   Pulled     21m (x2 over 24m)  kubelet  Container image "docker.io/bitnami/prometheus:2.54.1-debian-12-r4" already present on machine
  Warning  Unhealthy  20m (x7 over 24m)  kubelet  Startup probe failed: HTTP probe failed with statuscode: 503
  Warning  BackOff    17m (x6 over 21m)  kubelet  Back-off restarting failed container prometheus in pod prometheus-prometheus-kube-prometheus-prometheus-0_observabilidade(c872908c-a29c-4709-80b4-0f16ecb987ea)
