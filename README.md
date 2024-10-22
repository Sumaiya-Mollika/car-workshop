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
Before setting up the project on a new machine, ensure the following are installed:

1. **Flutter SDK**: Version 3.24.1 or higher.
   - [Install Flutter](https://flutter.dev/docs/get-started/install).
2. **Dart SDK**: This will be installed with Flutter.
3. **Android Studio / Xcode**: To run the app on Android or iOS.
4. **Firebase Account**: You need a Firebase project to configure authentication and Firestore.

### 1. Clone the Repository
Clone the project repository to your local machine:

```bash
git clone https://github.com/Sumaiya-Mollika/car-workshop.git
cd car-workshop
```

### 2. Install Dependencies
Run the following command to install all the dependencies specified in `pubspec.yaml`:

```bash
flutter pub get
```

### 3. Set Up for Android
1. **Install Android Studio**: Ensure you have Android Studio set up.
2. **Configure the Android SDK**: Make sure that the Android SDK is properly installed and available in your system's PATH.
3. **Connect Android Emulator or Device**:
   - If using an emulator, ensure the emulator is running.
   - If using a physical device, enable USB debugging.
4. **Run the App on Android**:
   ```bash
   flutter run
   ```

### 4. Set Up for iOS
1. **Install Xcode**: Ensure you have Xcode installed for iOS development (macOS required).
2. **Configure Signing in Xcode**:
   - Open the project in Xcode (`ios/Runner.xcworkspace`).
   - Set up your development team and signing certificates under the "Signing & Capabilities" tab.
3. **Run the App on iOS**:
   ```bash
   flutter run
   ```

### 5. Running on a New Machine
To set up and run this project on a new machine, follow these steps:

1. **Install Flutter and Dart**:
   - Visit [Flutter Installation Guide](https://flutter.dev/docs/get-started/install) to set up Flutter on your operating system.
   - Verify installation by running `flutter doctor` and resolve any issues.

2. **Install Xcode (macOS)**:
   - Install **Xcode** from the App Store for iOS development.
   - Run `sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer/` to set the Xcode path.

3. **Install Android Studio**:
   - Download and install Android Studio for Android development.
   - Set up the **Android SDK** by opening Android Studio and following the setup wizard.

4. **Clone the Project and Install Dependencies**:
   - Clone the project repository:
   
     ```bash
     git clone https://github.com/Sumaiya-Mollika/car-workshop.git
     cd car-workshop
     ```
   
   - Install the necessary Flutter dependencies:
   
     ```bash
     flutter pub get
     ```
   
5. **Run the Project**:
   - Use the `flutter run` command to run the project on an emulator or physical device.
