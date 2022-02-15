2 upstream application containers with sidecars + 1 ingress Envoy.
Cluster membership is resolved with DNS using dnsmasq.

Edit main.go to make the applications do whatever you want.

```
curl localhost:9786/app
```

To select a specific scenario (e.g. mTLS), mount the overridden files in each
scenario's directory in docker-compose.yml instead of the ones in the root
directory of the repo.