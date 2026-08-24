# Dev environment for [Sneat.app](https://sneat.app)

This repository provides scripts and local NGINX/emulator configuration for developing Sneat.app across the `sneat-apps` frontend, `sneat-go` backend, and `sneat-firebase` project.

## Our tech stack

- [Go](https://golang.org/) language and [AppEngine](https://cloud.google.com/appengine/) - for backend
- [Ionic](https://ionicframework.com/) on top of [Angular](https://angular.io/)/[TypeScript](https://www.typescriptlang.org/) - for frontend
- [Capacitor](https://capacitorjs.com/) - a cross-platform native runtime for web apps
- [Firebase](https://firebase.google.com/) - for [authentication](https://firebase.google.com/docs/auth)
  - [Firestore](https://firebase.google.com/docs/firestore) - for database & real-time updates

## Getting started

### Prerequisites
1. Install [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
1. Install [Go](https://golang.org/doc/install)
1. Install [Node.js](https://nodejs.org/en/download/)
1. Install [PNPM](https://pnpm.io/installation) package manager
   ```bash
   npm install pnpm -g
   ```
1. Create a `pnx` alias for `pnpm nx`
   ```bash
   alias pnx='pnpm nx'
   ```
1. Install [Firebase Emulator](https://firebase.google.com/docs/emulator-suite/install_and_configure)
   ```bash
   pnpm install -g firebase-tools
   ```
   We have instructions [how to run Firebase emulators](emulators) for Sneat.app.
   
1. Clone these repositories for the current local stack:
   - **Frontend**: https://github.com/sneat-co/sneat-apps
   - **Backend**: https://github.com/sneat-co/sneat-go (the former `sneat-go-server` code is now in this repository)
   - **Firebase/DB**: https://github.com/sneat-co/sneat-firebase

1. Install frontend packages by running `pnpm install` in root of `sneat-apps` repository folder


To start frontend & backend locally:
1. Start Firebase emulators by running [`sneat-go/scripts/serve_fb_emulator.sh`](https://github.com/sneat-co/sneat-go/blob/main/scripts/serve_fb_emulator.sh)
1. Start the backend by running [`sneat-go/scripts/serve_gae.sh`](https://github.com/sneat-co/sneat-go/blob/main/scripts/serve_gae.sh)
1. Start the frontend by running `pnpm nx serve sneat-app` in the root of the `sneat-apps` repository
1. Open Sneat.App local dev UI at [http://localhost:4200/](http://localhost:4200/)

## Scripts

- [repos.sh](repos.sh) - outputs list of Sneat repositories
- [clone-repos.sh](clone-repos.sh) - clones Sneat repositories
- [go-get-all.sh](go-get-all.sh) - runs `go get` for all repositories
- [go-build-all.sh](go-build-all.sh) - runs `go build` for all repositories
- [go-test-all.sh](go-test-all.sh) - runs `go test` for all repositories
- [nginx-self-signed-cert.sh](nginx-self-signed-cert.sh) - create self-signed certificate for serving app over HTTPS

## Serving app locally

To run app locally you'd need to run 3 processes:

- Serve web app by running `nx serve sneat-app` from the root folder of [sneat-apps](../sneat-apps).
- [Run Firebase emulators](emulators) for Sneat.app.

## Unit tests

We use [Vitest](https://vitest.dev/) for unit tests.

- To run tests for a specific project use `pnpm nx test <PROJECT_NAME>`, for example: `pnpm nx test sneat-app`
- To run all tests use `pnpm nx run-many --target=test --all`

## End-to-end tests

We use Playwright for end-to-end testing.

### Setting Up Playwright

Before running Playwright tests, ensure that all prerequisites listed in the "Getting Started" section are properly installed and set up.

## How to run end-to-end tests

TODO: Add instructions on how to run playwright tests.
