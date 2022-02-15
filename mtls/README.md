mTLS scenario: simulates the process of rotating a self-signed root CA that is
used to verify client certificates. Creates 2 client certs, one signed by an
old CA and another by a new one. We concat both CA's into one file and verify
that Envoy will accept requests signed by either client cert.

Run `mtls/create-certs.sh` to generate the certs, then mount the `envoy.yaml`
file in this directory to the `envoy` service in the root `docker-compose.yml`
instead of the default root `envoy.yaml`.

Note that it's important the two root CA's have different CN's, or else Envoy
will only validate client certs against the first CA - https://github.com/envoyproxy/envoy/issues/1220#issuecomment-929228737

`test.sh` curls the local endpoint with both client certs.