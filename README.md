# DueDojo

DueDojo is a student-focused deadline management app built with Flutter and Firebase, helping students stay organized and on top of their academic commitments.

![App Store Downloads](https://img.shields.io/badge/Downloads-300%2B-brightgreen)
![User Engagement](https://img.shields.io/badge/Engagement-70%25-blue)

## About DueDojo

DueDojo streamlines deadline management for students, providing an intuitive interface to track assignments, projects, and other academic tasks. Since its launch in July 2023, the app has built a growing user base with strong engagement metrics.

## Key Features

- **Deadline Tracking**: Easy-to-use interface for managing academic due dates
- **Course Organization**: Group tasks and deadlines by course or subject
- **Cross-Platform**: Available on both iOS and Android devices

## Technical Stack

- **Frontend**
  - Flutter/Dart for cross-platform development
  - FlutterFlow for rapid UI development and prototyping
  - Custom animations and transitions
  
- **Backend**
  - Firebase Realtime Database
  - Firebase Authentication
  - Firebase Cloud Messaging for notifications
  - Firebase Analytics for user engagement tracking

## Installation

### App Stores
- [Download on the App Store](https://apps.apple.com/in/app/duedojo/id6464222296)
- [Get it on Google Play](https://play.google.com/store/apps/details?id=com.NirajNamburi.duedojo&hl=en_US)

### Build from Source
1. Clone the repository
   ```bash
   git clone [repository-url]
   cd duedojo
   ```

2. Install dependencies
   ```bash
   flutter pub get
   ```

3. Configure Firebase
   - Add `google-services.json` for Android
   - Add `GoogleService-Info.plist` for iOS

4. Run the app
   ```bash
   flutter run
   ```

## Performance Metrics

- **User Base**: 300+ active users
- **Engagement Rate**: 70% over 5 months
- **Cross-Platform Usage**: Available on both iOS and Android
- **Launch Date**: November 2023

## Configuration

Create a `.env` file in the project root:
```
FIREBASE_API_KEY=your_api_key
FIREBASE_PROJECT_ID=your_project_id
FIREBASE_MESSAGING_SENDER_ID=your_sender_id
```

## Development

### Prerequisites
- Flutter SDK
- Dart SDK
- Firebase CLI
- FlutterFlow account (for UI modifications)
- iOS/Android development environment

### Setup Development Environment
1. Install Flutter SDK
2. Set up Firebase project
3. Configure FlutterFlow
4. Set up development certificates

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Acknowledgments

- Thanks to all our beta testers
- The Flutter and FlutterFlow communities
- Our active user base for their valuable feedback
