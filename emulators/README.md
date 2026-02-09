# Running emulators for local development and testing of Sneat.app

To use Firebase Authentication & Firestore emulators run this command in :

```shell
firebase emulators:start --only auth,firestore --project demo-sneat
```

To run with **real** authentication and only Firestore being emulated execute:

```shell
firebase emulators:start --only firestore --project demo-sneat
```

Both commands should be executed from the folder where you have your firebase config.
For sneat project we keep the configuration in the https://github.com/sneat-co/sneat-firebase repository.

## For using in frontend

To be defined.

## For using in backend

If you want the go backend Firebase SDKs to use Firebase emulators you would need to set next local variables:

```shell
export GCLOUD_PROJECT="demo-sneat"
export FIREBASE_AUTH_EMULATOR_HOST="localhost:9099"
export FIRESTORE_EMULATOR_HOST="localhost:8080"
```

Set path to Google Application Credentials files. For example:

```shell
export GOOGLE_APPLICATION_CREDENTIALS="~/projects/sneat/private_keys/sneat-54237a268b5a.json"
```

### Running with Google Firebase emulators:

Firebase Admin Go SDK is supposed
to [support Authentication emulator](https://github.com/firebase/firebase-admin-go/issues/409).
It has been merged with PR # [419](https://github.com/firebase/firebase-admin-go/pull/419)
on 21st April 2021 with
commit # [27ac52](https://github.com/firebase/firebase-admin-go/commit/27ac52fcc217798733768f26c2eb58cab54f5039).

[Firebase Emulator Admin SDK availability](https://firebase.google.com/docs/emulator-suite/install_and_configure#admin_sdk_availability)

