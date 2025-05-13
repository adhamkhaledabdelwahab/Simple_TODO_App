# Cozy Todo Delight - Flutter Version

A beautiful and intuitive todo list application built with Flutter, featuring a modern Material Design 3 interface, smooth animations, and full localization support in English and Arabic.

## Features

- ✨ Clean and modern UI with Material Design 3
- 📱 Responsive design that works on both iOS and Android
- 🎨 Task categorization with 7 categories:
  - Personal
  - Work
  - Shopping
  - Health
  - Education
  - Other
  - All (for filtering)
- 🔍 Smart search functionality with real-time filtering
- 📅 Due date support with date picker
- ⭐ Task priority levels (Low, Medium, High)
- 🌙 Dark mode support with automatic theme switching
- 💾 Persistent storage using SharedPreferences
- 🌍 Full internationalization in English and Arabic
- ♿ Accessibility support with semantic labels
- 🎯 Form validation and error handling

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- iOS Simulator or Android Emulator
- Xcode (for iOS development)
- Android Studio (for Android development)

### Installation

1. Clone the repository
```bash
git clone <repository-url>
cd cozy_todo_delight_flutter
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

## Project Structure

```
lib/
├── constants/      # App constants and enums
│   └── task_constants.dart
├── i18n/          # Internationalization
│   └── i18n.dart
├── models/        # Data models
│   └── task.dart
├── providers/     # State management
│   ├── task_provider.dart
│   └── theme_provider.dart
├── screens/       # App screens
│   ├── home_screen.dart
│   └── not_found_screen.dart
├── theme/         # Theme configuration
│   └── theme.dart
├── utils/         # Utility functions
│   └── helpers.dart
├── widgets/       # Reusable widgets
│   ├── category_filter.dart
│   ├── settings_buttons.dart
│   ├── task_form_dialog.dart
│   ├── task_item.dart
│   └── task_list.dart
└── main.dart      # App entry point

assets/
└── i18n/         # Localization files
    ├── en.json   # English strings
    └── ar.json   # Arabic strings
```

## Dependencies

- `provider`: ^6.0.0 - State management solution
- `shared_preferences`: ^2.0.0 - Persistent storage
- `intl`: ^0.18.0 - Internationalization and date formatting
- `flutter_localizations` - Flutter localization support

## Features in Detail

### Task Management
- Create, edit, and delete tasks
- Set task priority (Low, Medium, High)
- Assign tasks to categories
- Set due dates with date picker
- Mark tasks as complete/incomplete

### User Interface
- Material Design 3 components
- Responsive layout for all screen sizes
- Beautiful transitions and animations
- Category-based filtering
- Search functionality
- Dark mode support

### Localization
- Full support for English and Arabic
- RTL layout support for Arabic
- Localized dates and numbers
- Easy to add new languages

### State Management
- Provider pattern for state management
- Persistent storage of tasks and settings
- Efficient task filtering and sorting

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
