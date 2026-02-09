# Dev environment for [Sneat.app](https://sneat.app)

## Our tech stack

- [Go](https://golang.org/) language and [AppEngine](https://cloud.google.com/appengine/) - for backend
- [Ionic](https://ionicframework.com/) on top of [Angular](https://angular.io/)/[Typecript)(https://www.typescriptlang.org/) - for frontend
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
1. Create a `pnx` alias for `pnpm run nx`
   ```bash
   alias pnx='pnpm run nx'
   ```
1. Install [Firebase Emulator](https://firebase.google.com/docs/emulator-suite/install_and_configure)
   ```bash
   pnpm install -g firebase-tools
   ```
   We have instructions [how to run Firebase emulators](emulators) for Sneat.app.
   
1. Clone repositories using [clone-repos.sh](clone-repos.sh) script. At minimum you would need to clone this repositories:
   - **Frontend**: https://github.com/sneat-co/sneat-apps
   - **Backend**: https://github.com/sneat-co/sneat-go-server
   - **Firebase/DB**: https://github.com/sneat-co/sneat-firebase

1. Install frontend packages by running `pnpm install` in root of `sneat-apps` repository folder


To start frontend & backend locally:
1. Start Firebase Emulator by running [https://github.com/sneat-co/sneat-go-backend/blob/main/scripts/serve_fb_emulator.sh](serve-fb-emulator.sh) script
1. Start backend by running [serve-gae.sh](https://github.com/sneat-co/sneat-go-backend/blob/main/scripts/serve_gae.sh) script
1. Start frontend by running `pnpm run nx serve sneat-app` in root of `sneat-apps` repository folder
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

We sue `vitest` for unit tests.

- To run test for specific projext use `nx test <PROJECT_NAME>`, for example: `nx test sneat-app`
- To run all tests use `nx run-many --target=test --all`

## End-to-end tests

We use PlayWright for end-to-end testing.

### Setting Up PlayWright

Before running Cypress tests, wnsure that all prerequisites listed in the "Getting Started" section are properly installed and set up.

## How to run end-to-end tests

TODO: Add instructions on how to run playwright tests.
