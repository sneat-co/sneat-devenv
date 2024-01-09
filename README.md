# Dev environment for [Sneat.app](https://sneat.app)

## Our tech stack

- [Go](https://golang.org/) lang in [AppEngine](https://cloud.google.com/appengine/)  - for backend
- [Ionic](https://ionicframework.com/) on top of [Angular](https://angular.io/) - for frontend
- [Firebase](https://firebase.google.com/) - for hosting & authentication
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
1. Install [Firebase Emulator](https://firebase.google.com/docs/emulator-suite/install_and_configure)
   ```bash
   pnpm install -g firebase-tools
   ```
1. Clone repositories using [clone-repos.sh](clone-repos.sh) script
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

## Serving web app

You can serve web app by running `nx serve sneat-app` from the root folder of [sneat-apps](../sneat-apps).


## Cypress Testing for Sneat-Apps

Cypress is a powerful tool for end-to-end testing, and in the `sneat-apps` project, we can run these tests in different modes: development, production and CI. Each mode is tailored to meet specific needs during the testing process.

### Setting Up Cypress

Before running Cypress tests, ensure you have completed the following prerequisites:

1. Ensure that all prerequisites listed in the "Getting Started" section are properly installed and set up.
2. Confirm that the Firebase emulators are running. Use the following command to start the emulators if they're not already running:
   ```bash
   pnpm run cy:emulators
   ```
3. Make sure the `sneat-go-backend` is running. Follow the instructions in the `sneat-go-backend` project [README](https://github.com/sneat-co/sneat-go-backend/blob/main/README.md) to start the backend.

### Development Mode

In Development mode, tests are run in a way that prioritizes the ease of debugging over performance. This mode is ideal when actively developing and testing new features or fixing bugs. Here are some key aspects of the Development mode:

- **Source Maps:** Tests run with source maps enabled, allowing you to trace errors and logs back to your original source code. This feature significantly aids in debugging.
- **Performance:** Tests may run slower compared to Production mode due to the additional overhead of source maps and less optimization.
- **Usage:** To run Cypress tests in Development mode, use the following command:
  ```bash
  pnpm run cy:open:dev
  ```

### Production Mode

Production mode is optimized for performance, making it suitable for final testing before deployment or for routine checks where debugging is not the primary concern. Characteristics of this mode include:

- **Optimized Code:** Tests run on more optimized code, ensuring faster execution times. This is crucial for extensive test suites or when time is a factor.
- **No Source Maps:** Unlike Development mode, source maps are not available. This lack of source maps contributes to the faster performance but makes debugging more challenging.
- **Usage:** To run Cypress tests in Production mode, use the following command:
  ```bash
  pnpm run cy:test:prod
  ```

### Running Cypress Tests

You can run Cypress tests in either open mode or headless mode, depending on your needs:

#### Open Mode

- **Development Environment:**
  ```bash
  pnpm run cy:open:dev
  ```
- **Production Environment:**
  ```bash
  pnpm run cy:open:prod
  ```

#### Headless Mode

- **Continuous Integration Environment:**
  ```bash
  pnpm run cy:test:ci
  ```
- **Development Environment:**
  ```bash
  pnpm run cy:test:dev
  ```
- **Production Environment:**
  ```bash
  pnpm run cy:test:prod
  ```

### Additional Information

For any issues or further guidance, refer to the [Cypress Documentation](https://docs.cypress.io).

By understanding the distinctions between Development and Production modes, you can better leverage Cypress testing in the `sneat-apps` project to meet your testing goals.
