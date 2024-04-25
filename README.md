# LogiTech 🚚

Logistics Mobile Application with Backend Integrated

## Technologies ⚙️

- Flutter (Riverpod, GoRouter, Dio, Freezed, Firebase)
- Node.js (TypeScript, Express, Mongoose)
- MongoDB

## Features 📲

- Users can request delivery from a location to another destination
- Drivers will get push notification around an area
- Order location can be updated by driver with location verification
- Users can rate drivers for their delivery performance
- Users can pay through UPI app to the driver directly

## Running The Application 🧑🏻‍💻

- `git clone https://github.com/jagadeesh-k-2802/logitech-app-flutter`
- `cd server && npm i`
- Configure all required environment variables in `server/config/config.env.example`
- Remove .example from the filename it should be `config.env
- Install MongoDB Locally on Your System or use Cloud hosted connection string
- Download Firebase Admin Private Key JSON file and rename it it to `firebase-admin.json`
- Place the JSON file inside `server/config/`
- `npm run dev` to start the node server
- `dart pub global activate flutterfire_cli` Install flutterfire CLI
- `npm install -g firebase-tools` Install firebase CLI using NPM
- `cd mobile && flutterfire configure` Configure firebase using your own firebase project
- Place your Google maps API key in `./mobile/config/env.example.json`
- Again Place your Google Maps API key in `./mobile/android/secrets.defaults.properties` and remove the `defaults` from the filename
- If running on iOS also Place Google Maps API key in `./mobile/ios/Runner/AppDelegate.swift`
- open `./mobile` inside your code editor and run flutter app with the environment JSON file