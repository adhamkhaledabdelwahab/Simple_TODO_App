import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';
import '../i18n/i18n.dart';
import '../constants/task_constants.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(task.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16.0),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) {
        context.read<TaskProvider>().deleteTask(task.id);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.read<I18n>().get('tasks.taskDeleted')),
            action: SnackBarAction(
              label: context.read<I18n>().get('tasks.undo'),
              onPressed: () {
                context.read<TaskProvider>().addTask(task);
              },
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: ListTile(
          title: Text(
            task.title,
            style: TextStyle(
              color: Colors.black,
              decoration:
                  task.status == TaskStatus.completed
                      ? TextDecoration.lineThrough
                      : null,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (task.description.isNotEmpty)
                Text(
                  task.description,
                  style: TextStyle(
                    decoration:
                        task.status == TaskStatus.completed
                            ? TextDecoration.lineThrough
                            : null,
                  ),
                ),
              const SizedBox(height: 4),
              Consumer<I18n>(
                builder:
                    (context, i18n, _) => Row(
                      children: [
                        Chip(
                          label: Text(
                            i18n.get(
                              'categories.${task.category.name.toLowerCase()}',
                            ),
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.surfaceVariant,
                        ),
                        if (task.dueDate != null) ...[
                          const SizedBox(width: 8),
                          Chip(
                            label: Text(
                              task.dueDate != null
                                  ? i18n
                                      .get('date.format')
                                      .replaceAll(
                                        '{day}',
                                        task.dueDate!.day.toString(),
                                      )
                                      .replaceAll(
                                        '{month}',
                                        task.dueDate!.month.toString(),
                                      )
                                      .replaceAll(
                                        '{year}',
                                        task.dueDate!.year.toString(),
                                      )
                                  : i18n.get('tasks.noDate'),
                            ),
                            backgroundColor:
                                Theme.of(context).colorScheme.surfaceVariant,
                          ),
                        ],
                      ],
                    ),
              ),
            ],
          ),
          leading: Checkbox(
            value: task.status == TaskStatus.completed,
            onChanged: (bool? value) {
              if (value != null) {
                context.read<TaskProvider>().toggleTaskCompletion(task);
              }
            },
          ),
          trailing: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Edit task functionality will be handled by the parent widget
            },
          ),
        ),
      ),
    );
  }
}
