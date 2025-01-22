# Projects

A Flutter-based task management application.

## Description
This project demonstrates how to use Hive for local storage, Flutter Riverpod for state management, and integrates a clean architecture for managing tasks. Users can add, view, update, and delete tasks.

## Installation Guide
To run this project, you need to install the following dependencies:

### Dependencies
dependencies:
flutter:
sdk: flutter
cupertino_icons: ^1.0.8
flutter_riverpod: ^2.6.1
uuid: ^4.5.1
hive: ^2.2.3
hive_flutter: ^1.1.0

dev_dependencies:
flutter_test:
sdk: flutter
flutter_lints: ^4.0.0
hive_generator: ^2.0.1
build_runner: ^2.4.13

### Steps to Run the Application
1. Install Flutter and set up your development environment:
    - [Flutter Installation Guide](https://docs.flutter.dev/get-started/install)
2. Clone the repository:
   git clone <repository-url>
3. Navigate to the project directory:
   cd projects
4. Install dependencies:
   flutter pub get
5. Generate the Hive adapter:
   flutter pub run build_runner build
6. Run the app:
   flutter run

## Folder Structure
lib/
├── main.dart                 # Entry point of the application

├── models/                   # Data models (e.g., Task model)
│   ├── task.dart
├── providers/                # Riverpod state management files
│   ├── task_provider.dart
├── screens/                  # UI Screens
│   ├── task_screen.dart
├── services/                 # Local storage and other services
│   ├── local_storage_service.dart

## Features
- Add new tasks with a title and description.
- Mark tasks as completed.
- Delete tasks.
- Persistent local storage using Hive.

## Notes
- Ensure that Hive is properly initialized in `main.dart`.
- Run the `build_runner` command whenever you make changes to the `task.dart` model to regenerate the `task.g.dart` file.
