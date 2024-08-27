#!/bin/bash

#!/bin/bash

# When asked for passphrase enter anything at least 4 characters long. For example "1234"

SSL_DIR="/etc/ssl"
CERTS_DIR="$SSL_DIR/certs"
KEYS_DIR="$SSL_DIR/private"

echo "Creating a directory for the SSL key & certificate..."
mkdir -p "$KEYS_DIR"
mkdir -p "$CERTS_DIR"

KEY="/etc/ssl/private/local.sneat.ws.key"
CERT="/etc/ssl/certs/local.sneat.ws.crt"

if [ -f "$KEY" ]; then
  echo "Removing existing key files..."
  rm -f $KEY
fi

if [ -f "$CERT" ]; then
  echo "Removing existing certificate file..."
  rm -f $CERT
fi

echo "Generating an SSL private key & SSL certificate..."
sudo openssl req \
  -new -x509 -nodes -days 365 -newkey rsa:2048 \
  -subj "/C=IE/ST=Munster/L=Limerick/O=Sneat.co/CN=local.sneat.ws" \
  -config openssl-local.sneat.ws.cnf \
  -keyout $KEY \
  -out $CERT

#echo "Creating Diffie-Hellman PEM key..."
#openssl dhparam -out /etc/ssl/certs/dhparam.pem 1024

#chown -R www-data:www-data "$CERTS_DIR"
echo "chmod -R 755 $CERTS_DIR..."
chmod -R 755 "$CERTS_DIR"

#chown -R www-data:www-data "$KEYS_DIR"
echo "chmod -R 755 $KEYS_DIR..."
chmod -R 755 "$KEYS_DIR"

sudo security add-trusted-cert \
  -d -r trustRoot \
  -k /Library/Keychains/System.keychain "$CERT"

# openssl x509 -in /etc/ssl/certs/local.sneat.ws.crt -text -noout
