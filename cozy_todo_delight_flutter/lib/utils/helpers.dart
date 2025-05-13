import 'package:intl/intl.dart';
import '../models/task.dart';
import '../constants/task_constants.dart';

String formatDate(DateTime date) {
  return DateFormat.yMMMd().format(date);
}

List<Task> filterTasks(
  List<Task> tasks,
  TaskCategory category,
  TaskStatus status,
  String searchQuery,
) {
  return tasks.where((task) {
    final matchesCategory = category == TaskCategory.all || task.category == category;
    final matchesStatus = status == task.status;
    final matchesSearch = searchQuery.isEmpty ||
        task.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
        task.description.toLowerCase().contains(searchQuery.toLowerCase());

    return matchesCategory && matchesStatus && matchesSearch;
  }).toList();
}

List<Task> sortTasks(List<Task> tasks, String sortBy) {
  final tasksToSort = List<Task>.from(tasks);

  switch (sortBy) {
    case 'dueDate':
      return tasksToSort..sort((a, b) {
        if (a.dueDate == null) return 1;
        if (b.dueDate == null) return -1;
        return a.dueDate!.compareTo(b.dueDate!);
      });
    case 'priority':
      final priorityOrder = {
        TaskPriority.high: 0,
        TaskPriority.medium: 1,
        TaskPriority.low: 2,
      };
      return tasksToSort..sort((a, b) => 
        priorityOrder[a.priority]!.compareTo(priorityOrder[b.priority]!));
    case 'title':
      return tasksToSort..sort((a, b) => a.title.compareTo(b.title));
    case 'createdAt':
    default:
      return tasksToSort..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }
}
