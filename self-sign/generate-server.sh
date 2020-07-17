#!/bin/bash
CA=root-ca
CLIENT=server

mkdir -p out
rm -f ../certs/${CLIENT}.*

### PACKAGE CLIENT
openssl req -new -sha256 -nodes -newkey rsa:2048 -keyout ../certs/${CLIENT}.key -out ../certs/${CLIENT}.csr -config openssl-${CLIENT}.cnf 
openssl x509 -days 5000 -req -in ../certs/${CLIENT}.csr -out ../certs/${CLIENT}.crt -CA ../certs/${CA}.crt -CAkey ../certs/${CA}.key -CAserial ../certs/${CA}.srl -extensions v3_req -extfile openssl-${CLIENT}.cnf 
openssl pkcs12 -export -in ../certs/${CLIENT}.crt -inkey ../certs/${CLIENT}.key -out ../certs/${CLIENT}.pfx
