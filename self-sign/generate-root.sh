#!/bin/bash
CA=root-ca

mkdir -p out
rm -f ../certs/${CA}.*

### CA ROOT
openssl req -x509 -nodes -days 5000 -newkey rsa:2048 -keyout ../certs/${CA}.key -out ../certs/${CA}.crt -config openssl-${CA}.cnf
openssl rand -hex 16 > ../certs/${CA}.srl
