
#!/bin/bash
mkdir -p wiremock/certs wiremock/mappings

openssl req -x509 -newkey rsa:4096 -keyout wiremock/certs/key.pem -out wiremock/certs/cert.pem \
  -days 365 -nodes \
  -subj "/C=ES/ST=Madrid/L=Madrid/O=Dev/CN=localhost"

openssl pkcs12 -export \
  -in wiremock/certs/cert.pem \
  -inkey wiremock/certs/key.pem \
  -out wiremock/certs/keystore.p12 \
  -name wiremock \
  -passout pass:password

echo "✅ Certificados generados en wiremock/certs/"
