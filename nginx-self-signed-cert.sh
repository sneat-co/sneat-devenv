#!/bin/bash

# When asked for passphrase enter anything at least 4 characters long. For example "1234"

echo "Generating an SSL private key to sign your certificate..."
openssl genrsa -des3 -out sneat-app-dev-ssl.key 2048

echo "Generating a Certificate Signing Request..."
# Make sure to enter all values (Common Name, Organization, etc.), but leave challenge password blank.
openssl req -new -key sneat-app-dev-ssl.key -out sneat-app-dev-ssl.csr

  echo "Removing passphrase from key (for nginx)..."
cp sneat-app-dev-ssl.key sneat-app-dev-ssl.key.org
openssl rsa -in sneat-app-dev-ssl.key.org -out sneat-app-dev-ssl.key
rm sneat-app-dev-ssl.key.org

echo "Generating certificate..."
openssl x509 -req -days 365 -in sneat-app-dev-ssl.csr -signkey sneat-app-dev-ssl.key -out sneat-app-dev-ssl.crt

echo "Showing all 'sneat-app-dev-ssl.*' files..."
ls -l sneat-app-dev-ssl.*

echo "Removing file sneat-app-dev-ssl.csr..."
rm sneat-app-dev-ssl.csr

echo "Creating directory /etc/ssl/certs"
sudo mkdir -p  /etc/ssl/certs

echo "Moving certificate (sneat-app-dev-ssl.crt) to /etc/ssl/certs"
sudo mv sneat-app-dev-ssl.crt /etc/ssl/certs

echo "Creating directory /etc/ssl/private"
sudo mkdir -p  /etc/ssl/private

echo "Moving key (sneat-app-dev-ssl.key) to /etc/ssl/private"
sudo mv sneat-app-dev-ssl.key /etc/ssl/private
