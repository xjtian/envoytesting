Ingress envoy -> sidecar envoy -> backend workload.

Backend handler sleeps 10 seconds before writing response.

```
$ docker-compose up -d
$ curl localhost:9786/app

# In a different terminal instance, kill the backend:
$ docker-compose stop server

# the curl will output:

  upstream connect error or disconnect/reset before headers. reset reason: connection termination
```
