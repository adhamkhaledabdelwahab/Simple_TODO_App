import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';

// Storage Keys
const tasksStorageKey = 'todoApp_tasks';
const themeStorageKey = 'todoApp_theme';
const languageStorageKey = 'todoApp_language';

// Task Storage Functions
Future<List<Task>> getTasks() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = prefs.getString(tasksStorageKey);
    if (tasksJson != null) {
      final List<dynamic> decoded = json.decode(tasksJson);
      return decoded.map((task) => Task.fromJson(task)).toList();
    }
    return [];
  } catch (error) {
    print('Error retrieving tasks from storage: $error');
    return [];
  }
}

Future<void> saveTasks(List<Task> tasks) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = json.encode(tasks.map((task) => task.toJson()).toList());
    await prefs.setString(tasksStorageKey, tasksJson);
  } catch (error) {
    print('Error saving tasks to storage: $error');
  }
}

// Theme Storage Functions
Future<String?> getStoredTheme() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(themeStorageKey);
  } catch (error) {
    print('Error retrieving theme from storage: $error');
    return null;
  }
}

Future<void> saveTheme(String theme) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(themeStorageKey, theme);
  } catch (error) {
    print('Error saving theme to storage: $error');
  }
}

// Language Storage Functions
Future<String?> getStoredLanguage() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(languageStorageKey);
  } catch (error) {
    print('Error retrieving language from storage: $error');
    return null;
  }
}

Future<void> saveLanguage(String language) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(languageStorageKey, language);
  } catch (error) {
    print('Error saving language to storage: $error');
  }
}
