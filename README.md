2 upstream application containers with sidecars + 1 ingress Envoy.
Cluster membership is resolved with DNS using dnsmasq.

Edit main.go to make the applications do whatever you want.

```
curl localhost:9786/app
```