import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';
import '../i18n/i18n.dart';
import '../constants/task_constants.dart';

class TaskFormDialog extends StatefulWidget {
  final Task? task;

  const TaskFormDialog({
    super.key,
    this.task,
  });

  @override
  State<TaskFormDialog> createState() => _TaskFormDialogState();
}

class _TaskFormDialogState extends State<TaskFormDialog> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  TaskCategory _category = TaskCategory.personal;
  TaskPriority _priority = TaskPriority.medium;
  DateTime? _dueDate;

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _title = widget.task!.title;
      _description = widget.task!.description;
      _category = widget.task!.category;
      _priority = widget.task!.priority;
      _dueDate = widget.task!.dueDate;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dueDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        _dueDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Consumer<I18n>(
        builder: (context, i18n, _) => Text(
          widget.task == null ? i18n.get('tasks.addTask') : i18n.get('tasks.editTask')
        ),
      ),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: _title,
                decoration: InputDecoration(
                  labelText: context.read<I18n>().get('tasks.title'),
                  hintText: context.read<I18n>().get('tasks.enterTitle'),
                ),
                autofocus: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.read<I18n>().get('tasks.pleaseEnterTitle');
                  }
                  return null;
                },
                onChanged: (value) => _title = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _description,
                decoration: InputDecoration(
                  labelText: context.read<I18n>().get('tasks.description'),
                  hintText: context.read<I18n>().get('tasks.enterDescription'),
                ),
                maxLines: 3,
                onChanged: (value) => _description = value!,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<TaskPriority>(
                value: _priority,
                decoration: InputDecoration(
                  labelText: context.read<I18n>().get('tasks.priority'),
                ),
                items: TaskPriority.values
                    .map<DropdownMenuItem<TaskPriority>>((TaskPriority value) {
                  return DropdownMenuItem<TaskPriority>(
                    value: value,
                    child: Text(context.read<I18n>().get('priority.${value.name}')),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _priority = value;
                    });
                  }
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<TaskCategory>(
                value: _category,
                decoration: InputDecoration(
                  labelText: context.read<I18n>().get('tasks.category'),
                ),
                items: TaskCategory.values
                    .where((c) => c != TaskCategory.all)
                    .map<DropdownMenuItem<TaskCategory>>((TaskCategory value) {
                  return DropdownMenuItem<TaskCategory>(
                    value: value,
                    child: Text(context.read<I18n>().get('categories.${value.name.toLowerCase()}')),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _category = value;
                    });
                  }
                },
              ),
              const SizedBox(height: 16),
              Consumer<I18n>(
                builder: (context, i18n, _) => ListTile(
                  title: Text(i18n.get('tasks.dueDate')),
                  subtitle: Text(
                    _dueDate != null
                        ? '${_dueDate?.day}/${_dueDate?.month}/${_dueDate?.year}'
                        : i18n.get('tasks.noDate'),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_dueDate != null)
                        IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              _dueDate = null;
                            });
                          },
                        ),
                      IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () => _selectDate(context),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Consumer<I18n>(
            builder: (context, i18n, _) => Text(i18n.get('actions.cancel')),
          ),
        ),
        FilledButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final task = Task(
                id: widget.task?.id,
                title: _title,
                description: _description,
                category: _category,
                priority: _priority,
                status: widget.task?.status ?? TaskStatus.incomplete,
                dueDate: _dueDate,
              );
              if (widget.task == null) {
                context.read<TaskProvider>().addTask(task);
              } else {
                context.read<TaskProvider>().updateTask(task);
              }
              Navigator.of(context).pop();
            }
          },
          child: Consumer<I18n>(
            builder: (context, i18n, _) => Text(
              widget.task == null ? i18n.get('actions.add') : i18n.get('actions.save')
            ),
          ),
        ),
      ],
    );
  }
}
