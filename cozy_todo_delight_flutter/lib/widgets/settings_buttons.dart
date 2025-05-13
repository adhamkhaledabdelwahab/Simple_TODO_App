import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../i18n/i18n.dart';

class SettingsButtons extends StatelessWidget {
  const SettingsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Theme toggle button
        Consumer<ThemeProvider>(
          builder: (context, themeProvider, _) => IconButton(
            icon: Icon(
              themeProvider.themeMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () => themeProvider.toggleTheme(),
            tooltip: themeProvider.themeMode == ThemeMode.light
                ? 'Switch to dark mode'
                : 'Switch to light mode',
          ),
        ),
        const SizedBox(width: 8),
        // Language toggle button
        Consumer<I18n>(
          builder: (context, i18n, _) => IconButton(
            icon: Text(
              i18n.currentLocale.languageCode.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onPressed: () => i18n.toggleLocale(),
            tooltip: i18n.currentLocale.languageCode == 'en'
                ? 'Switch to Arabic'
                : 'Switch to English',
          ),
        ),
      ],
    );
  }
}
