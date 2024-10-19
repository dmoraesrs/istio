#12 [ 8/13] RUN chmod 666 /var/run/docker.sock
#12 0.254 chmod: cannot access '/var/run/docker.sock': No such file or directory
#12 ERROR: process "/bin/sh -c chmod 666 /var/run/docker.sock" did not complete successfully: exit code: 1
------
 > [ 8/13] RUN chmod 666 /var/run/docker.sock:
0.254 chmod: cannot access '/var/run/docker.sock': No such file or directory
------
Dockerfile:52
--------------------
  50 |     
  51 |     # Define permissões para o socket Docker
  52 | >>> RUN chmod 666 /var/run/docker.sock
  53 |     
  54 |     # Copia o certificado e atualiza a CA
--------------------
ERROR: failed to solve: process "/bin/sh -c chmod 666 /var/run/docker.sock" did not complete successfully: exit code: 1
##[error]#0 building with "default" instance using docker driver
##[error]#1 [internal] load build definition from Dockerfile
##[error]#1 transferring dockerfile: 2.08kB done
##[error]#1 DONE 0.0s
##[error]#2 [internal] load metadata for docker.io/library/ubuntu:20.04
##[error]#2 DONE 0.0s
