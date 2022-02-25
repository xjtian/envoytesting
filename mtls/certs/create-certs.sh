#! /usr/bin/env bash

# Create 2 root CA's
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -out rootCA1.pem -keyout rootCA1.key -subj "/C=US/CN=rootca.io"
#openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -out rootCA2.pem -keyout rootCA2.key -subj "/C=US/CN=rootca2.io"

# Sign a server cert w/ rootCA1
openssl genrsa -out server.key 2048
openssl req -new -key server.key -out server.csr -subj "/C=US/CN=myserv.local"
openssl x509 -req -in server.csr -CA rootCA1.pem -CAkey rootCA1.key -CAcreateserial -out server.pem -days 3650 -sha256
rm server.csr

# Sign 2 client certs w/ rootCA1, rootCA2
openssl genrsa -out clientone.key 2048
openssl req -new -key clientone.key -out clientone.csr -subj "/C=US/CN=clientone"
openssl x509 -req -in clientone.csr -CA rootCA1.pem -CAkey rootCA1.key -CAcreateserial -out clientone.pem -days 3650 -sha256
rm clientone.csr

#openssl genrsa -out clienttwo.key 2048
#openssl req -new -key clienttwo.key -out clienttwo.csr -subj "/C=US/CN=clienttwo"
#openssl x509 -req -in clienttwo.csr -CA rootCA2.pem -CAkey rootCA2.key -CAcreateserial -out clienttwo.pem -days 3650 -sha256
#rm clienttwo.csr

# Concat both CA's into one file:
#cat rootCA1.pem rootCA2.pem > rootCA.pem