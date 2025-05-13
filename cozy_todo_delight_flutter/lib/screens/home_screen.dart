import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/task_list.dart';
import '../widgets/add_task_fab.dart';
import '../widgets/search_bar.dart';
import '../widgets/category_filter.dart';
import '../widgets/settings_buttons.dart';
import '../widgets/task_form_dialog.dart';
import '../i18n/i18n.dart';
import '../models/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Task? selectedTask;
  bool isTaskFormOpen = false;

  void handleEditTask(Task task) {
    showDialog(
      context: context,
      builder: (context) => TaskFormDialog(task: task),
    );
  }

  void handleAddTask() {
    showDialog(
      context: context,
      builder: (context) => TaskFormDialog(task: null),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<I18n>(
          builder: (context, i18n, _) => Text(i18n.get('app.title')),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        actions: const [
          SettingsButtons(),
          SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer<I18n>(
                  builder: (context, i18n, _) => Text(
                    i18n.get('tasks.myTasks'),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                const SizedBox(height: 16),
                const CustomSearchBar(),
                const SizedBox(height: 16),
                const CategoryFilter(),
              ],
            ),
          ),
          const Expanded(
            child: TaskList(),
          ),
        ],
      ),
      floatingActionButton: AddTaskFAB(
        onPressed: handleAddTask,
      ),
    );
  }
}
