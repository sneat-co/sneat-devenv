# Hosts setup for running Sneat.app locally

To run Sneat.app locally to support integration with  3d party services (like Telegram Login)
we need to serve it over HTTPS on a hardcoded domain name.

To do this, we need to add the following entries to `/etc/hosts` file:

# Added for Sneat.app development
127.0.0.1       local.YOUR-NGROK-DOMAIN

127.0.0.1       local.sneat.ws                                                                                                                                                                 
127.0.0.1       local-api.sneat.ws                                                                                                                                                             
127.0.0.1       local-app.sneat.ws                                                                                                                                                             
127.0.0.1       local-fb-auth.sneat.ws                                                                                                                                                         
127.0.0.1       local-firestore.sneat.ws
```