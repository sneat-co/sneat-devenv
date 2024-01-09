# NGINX configuration for Sneat.app project

## Self-signed certificate for NGINX

To generate a self-signed certificate for serving local sites over HTTPS you can
use [nginx-self-signed-cert.sh](nginx-self-signed-cert.sh).

Then you can use the following NGINX configuration:

```
    server {
        listen 443 ssl;
        ssl_certificate      /etc/ssl/certs/sneat-app-dev-ssl.crt;
        ssl_certificate_key  /etc/ssl/private/sneat-app-dev-ssl.key;
        server_name local.sneat.app;
        location localhost:4200/ {[nginx.conf](..%2F..%2F..%2F..%2F..%2Fopt%2Fhomebrew%2Fetc%2Fnginx%2Fnginx.conf)
        }
    }
```[nginx](..%2F..%2F..%2F..%2F..%2Fopt%2Fhomebrew%2Fetc%2Fnginx)

To see location of the NGINX configuration file run:

```
nginx -t
```

To start NGINX run:

```
nginx
```

To stop NGINX run:

```
nginx -s stop
```
