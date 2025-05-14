import 'package:cozy_todo_delight_flutter/constants/task_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../i18n/i18n.dart';
import 'task_item.dart';
import 'task_form_dialog.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<TaskProvider>().tasks;
    final currentCategory = context.watch<TaskProvider>().currentCategory;

    if (tasks.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.task_alt,
              size: 64,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            Consumer<I18n>(
              builder:
                  (context, i18n, _) => Text(
                    i18n.get('tasks.noTasks'),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
            ),
            const SizedBox(height: 8),
            Consumer<I18n>(
              builder:
                  (context, i18n, _) => Text(
                    i18n.get('tasks.addFirstTask'),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
            ),
          ],
        ),
      );
    }
    final rTasks = tasks.where((e) => e.category == currentCategory || currentCategory == TaskCategory.all).toList();
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: rTasks.length,
      itemBuilder: (context, index) {
        final task = rTasks[index];
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => TaskFormDialog(task: task),
            );
          },
          child: TaskItem(task: task),
        );
      },
    );
  }
}
