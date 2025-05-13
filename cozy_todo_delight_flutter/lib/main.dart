import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_screen.dart';
import 'providers/task_provider.dart';
import 'providers/theme_provider.dart';
import 'i18n/i18n.dart';
import 'theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  final i18n = await I18n.getInstance();
  runApp(MyApp(i18n: i18n));
}

class MyApp extends StatelessWidget {
  final I18n i18n;
  const MyApp({super.key, required this.i18n});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TaskProvider(),
        ),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider.value(value: i18n),
      ],
      child: Consumer2<ThemeProvider, I18n>(
        builder: (context, themeProvider, i18n, _) {
          return MaterialApp(
            title: i18n.get('app.title'),
            themeMode: themeProvider.themeMode,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            locale: i18n.currentLocale,
            supportedLocales: I18n.supportedLocales,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
