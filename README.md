# 📓 Notes App

A beautifully designed and efficient Notes app built using **`Flutter`** and **`sqflite`** for managing and organizing your notes seamlessly. This app provides a simple and elegant interface to take, save, and manage notes offline.

## Features ✨

- **Create Notes**: Effortlessly add new notes with just a few taps. 📝
- **Edit Notes**: Update and modify your existing notes as needed. ✏️
- **Delete Notes**: Remove notes you no longer need. 🗑️
- **View Notes**: Easily browse through all your saved notes in a well-organized manner. 📖
- **Offline Access**: All data is stored locally using `sqflite` for quick access and reliability. 📶

## Screenshots 📸

><img src="https://github.com/Mohamed-n-Bashar/Notes-App/blob/main/NotesApp.png" alt="Notes App Screenshot" width="300"/>

## Technologies Used 🛠️

- **Flutter**: A framework for building cross-platform mobile applications.
- **sqflite**: A plugin for Flutter that provides an easy way to work with SQLite databases on both Android and iOS.

## Getting Started 🚀

To get started with the Notes app, follow these instructions:

### Prerequisites ✅

- **Flutter SDK**: Ensure you have Flutter installed on your system. [Get Flutter](https://flutter.dev/docs/get-started/install)
- **Dart**: Comes bundled with Flutter SDK.

### Installation 🏗️

1. Clone the repository:
   ```bash
   git clone https://github.com/Mohamed-n-Bashar/notes-app.git
   ```
2. Navigate into the project directory:
   ```bash
    cd notes-app
   ```
3. Get the dependencies:
   ```bash
    flutter pub get
   ```
4. Run the app:
   ```bash
    flutter run
   ```
## Database Structure 🗄️
The app uses the sqflite package to handle local data storage. The database schema includes a table for storing notes with the following fields:

- **id**: Unique identifier for each note. 🔑
- **content**: Main content/body of the note. 📜
- **timestamp**: Date and time when the note was created or last updated. ⏰
## Folder Structure 📁
Here's a brief overview of the folder structure:

```bash
lib/
│
├── main.dart           # Entry point of the application
├── models/             # Contains data models
├── utils/              # Extention used in the app
└── services/           # Database service for handling sqflite operations
```
## Dependencies 📦

- **sqflite**: SQLite plugin for Flutter.
- **path_provider**: Provides the correct paths for storing the database files.

You can check out all the dependencies in the `pubspec.yaml` file.

## Contributing 🤝

Contributions are welcome! If you have any suggestions or want to add new features, feel free to fork the repository and create a pull request. Please make sure to follow the contributing guidelines.

## License 📝

This project is licensed under the MIT License. See the `LICENSE` file for more details.

## Developed by **` Mohamed Bashar `** 👨‍💻

If you like this project, don't forget to give it a ⭐ on GitHub!
