#!/bin/zsh

# This backend repose are most likely to be looked at and to be modified during development
echo "sneat-co/sneat-go-core" # Core packages for Sneat backend
echo "sneat-co/sneat-core-modules" # Core business modules for Sneat backend
echo "sneat-co/sneat-go-backend" # Holds extra modules

# At least 3 repos are required to run Sneat.app locally
echo "sneat-co/sneat-apps" # Frontend (Angular app)
echo "sneat-co/sneat-firebase" # Binding for DALgo to Firebase specific for Sneat backend
echo "sneat-co/sneat-go-server" # Runs Sneat backend server locally
