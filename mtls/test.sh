#! /usr/bin/env bash

# Both of these requests should succeed
curl -k https://localhost:9786/app --cert certs/clientone.pem --key certs/clientone.key
curl -k https://localhost:9786/app --cert certs/clienttwo.pem --key certs/clienttwo.key