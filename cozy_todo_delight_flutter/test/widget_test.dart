// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:cozy_todo_delight_flutter/main.dart';
import 'package:cozy_todo_delight_flutter/i18n/i18n.dart';
import 'package:cozy_todo_delight_flutter/widgets/search_bar.dart';
import 'package:cozy_todo_delight_flutter/widgets/category_filter.dart';
import 'package:cozy_todo_delight_flutter/widgets/task_list.dart';
import 'package:cozy_todo_delight_flutter/widgets/add_task_fab.dart';

void main() {
  testWidgets('App renders home screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await SharedPreferences.getInstance();
    final i18n = await I18n.getInstance();
    await tester.pumpWidget(MyApp(i18n: i18n));

    // Verify that the app title is displayed
    expect(find.text(i18n.get('app.title')), findsOneWidget);

    // Verify that the search bar is present
    expect(find.byType(CustomSearchBar), findsOneWidget);

    // Verify that the category filter is present
    expect(find.byType(CategoryFilter), findsOneWidget);

    // Verify that the task list is present
    expect(find.byType(TaskList), findsOneWidget);

    // Verify that the add task FAB is present
    expect(find.byType(AddTaskFAB), findsOneWidget);
  });
}
