# CarWorkshop - A Car Workshop Management App

CarWorkshop is a cross-platform mobile app built with Flutter that helps manage car service bookings for a workshop. The app includes user authentication, role-based access (admin/mechanic), and a calendar view for tracking car service bookings. Admins can create and manage bookings, while mechanics can view jobs assigned to them.

## Features
- **User Authentication**: Email and password-based authentication with Firebase.
- **Role Management**: Different roles (admin, mechanic) with specific access rights.
- **Service Bookings**: Admins can create, view, and assign mechanics to service bookings.
- **Calendar View**: Displays service bookings for a given day, week, or month.
- **Mechanic View**: Mechanics can see only the jobs assigned to them.
- **Real-Time Updates**: Real-time data syncing with Firebase Firestore.
- **Responsive UI**: Adaptable to different screen sizes.

## Tech Stack
- **Flutter**: For cross-platform mobile development.
- **GetX**: For state management, routing, and dependency injection.
- **Firebase Auth**: For user authentication.
- **Firestore**: For storing and retrieving service booking data.
- **table_calendar**: For displaying bookings in a calendar view.
- **google_fonts**: For custom fonts.

## Setup Instructions

### Prerequisites
- **Flutter SDK**: Version 3.5.1 or higher.
- **Firebase Project**: You need a Firebase project to configure authentication and Firestore.

### 1. Clone the Repository
Clone the project repository to your local machine:

```bash
git https://github.com/Sumaiya-Mollika/car-workshop.git
cd car-workshop
```

### 2. Install Dependencies
Run the following command to install all the dependencies specified in `pubspec.yaml`:

```bash
flutter pub get
```

### 3. Firebase Configuration

1. **Firebase Setup**:
   - Go to [Firebase Console](https://console.firebase.google.com/).
   - Create a new Firebase project.
   - Enable **Firebase Authentication** (Email/Password).
   - Enable **Cloud Firestore** for the project.

2. **Add Firebase Configuration to Flutter**:
   - Download `google-services.json` for Android and `GoogleService-Info.plist` for iOS from Firebase.
   - Place the files in the following locations:
     - `android/app/google-services.json`
     - `ios/Runner/GoogleService-Info.plist`

3. **Update Firebase Core Initialization**:
   - Ensure Firebase is properly initialized in your app by adding the following in `main.dart`:

   ```dart
   void main() async {
     WidgetsFlutterBinding.ensureInitialized();
     await Firebase.initializeApp();
     runApp(MyApp());
   }
   ```

### 4. Build and Run the App

To run the app on your device or emulator:

```bash
flutter run
```

For Android:
```bash
flutter build apk
```

For iOS (macOS required):
```bash
flutter build ios
```