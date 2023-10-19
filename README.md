# Dev environment for [Sneat.app](https://sneat.app)

## Our tech stack

- [Go](https://golang.org/) lang in [AppEngine](https://cloud.google.com/appengine/)  - for backend
- [Ionic](https://ionicframework.com/) on top of [Angular](https://angular.io/) - for frontend
- [Firebase](https://firebase.google.com/) - for hosting & authentication
- [Firestore](https://firebase.google.com/docs/firestore) - for database & real-time updates

## Getting started

1. Install [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
1. Install [Go](https://golang.org/doc/install)
1. Install [Node.js](https://nodejs.org/en/download/)
1. Install [PNPM](https://pnpm.io/installation) package manager
   ```bash
   npm install pnpm -g
   ```
1. Install [Firebase Emulator](https://firebase.google.com/docs/emulator-suite/install_and_configure)
   ```bash
   pnpm install -g firebase-tools
   ```
1. Clone repositories using [clone-repos.sh](clone-repos.sh) script
1. Install frontend packages by running [pnpm-i.sh](pnpm-i.sh) script
1. Start Firebase Emulator by running [serve-fb-emulator.sh](serve-fb-emulator.sh) script
1. Start backend by running [serve-backend.sh](serve-backend.sh) script
1. Start frontend by running [serve-frontend.sh](serve-frontend.sh) script
1. Open Sneat.App local dev UI at [http://localhost:4200/](http://localhost:4200/)

## Scripts

- [repos.sh](repos.sh) - outputs list of Sneat repositories
- [clone-repos.sh](clone-repos.sh) - clones Sneat repositories
- [go-get-all.sh](go-get-all.sh) - runs `go get` for all repositories
- [go-build-all.sh](go-build-all.sh) - runs `go build` for all repositories
- [go-test-all.sh](go-test-all.sh) - runs `go test` for all repositories
