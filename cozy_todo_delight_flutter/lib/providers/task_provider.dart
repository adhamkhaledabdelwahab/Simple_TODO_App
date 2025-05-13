import 'package:flutter/foundation.dart';
import '../models/task.dart';
import '../constants/task_constants.dart';
import '../utils/helpers.dart';
import '../utils/storage.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];
  bool _isLoading = true;
  TaskCategory _currentCategory = TaskCategory.all;
  TaskStatus _statusFilter = TaskStatus.incomplete;
  String _searchQuery = '';
  TaskProvider() {
    _loadTasks();
  }

  List<Task> get tasks => _tasks;
  bool get isLoading => _isLoading;
  TaskCategory get currentCategory => _currentCategory;
  TaskStatus get statusFilter => _statusFilter;
  String get searchQuery => _searchQuery;

  List<Task> get filteredTasks => filterTasks(
        _tasks,
        _currentCategory,
        _statusFilter,
        _searchQuery,
      );

  void setCategory(TaskCategory category) {
    _currentCategory = category;
    notifyListeners();
  }

  void setStatusFilter(TaskStatus status) {
    _statusFilter = status;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    _tasks.add(task);
    await _saveTasks();
    notifyListeners();
  }

  Future<void> updateTask(Task task) async {
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _tasks[index] = task;
      await _saveTasks();
      notifyListeners();
    }
  }

  Future<void> deleteTask(String id) async {
    _tasks.removeWhere((task) => task.id == id);
    await _saveTasks();
    notifyListeners();
  }

  Future<void> toggleTaskCompletion(Task task) async {
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _tasks[index] = task.copyWith(
        status: task.status == TaskStatus.completed
            ? TaskStatus.incomplete
            : TaskStatus.completed,
      );
      await _saveTasks();
      notifyListeners();
    }
  }

  Future<void> _loadTasks() async {
    _isLoading = true;
    notifyListeners();

    try {
      _tasks = await getTasks();
    } catch (error) {
      debugPrint('Error loading tasks: $error');
      _tasks = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> _saveTasks() async {
    try {
      await saveTasks(_tasks);
    } catch (error) {
      debugPrint('Error saving tasks: $error');
    }
  }
}
