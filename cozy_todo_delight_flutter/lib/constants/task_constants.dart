enum TaskPriority {
  low,
  medium,
  high,
}

enum TaskCategory {
  all,
  personal,
  work,
  shopping,
  health,
  education,
  other,
}

enum TaskStatus {
  incomplete,
  completed,
}

extension TaskPriorityExtension on TaskPriority {
  String get name {
    switch (this) {
      case TaskPriority.low:
        return 'low';
      case TaskPriority.medium:
        return 'medium';
      case TaskPriority.high:
        return 'high';
    }
  }

  static TaskPriority fromString(String value) {
    switch (value) {
      case 'low':
        return TaskPriority.low;
      case 'medium':
        return TaskPriority.medium;
      case 'high':
        return TaskPriority.high;
      default:
        return TaskPriority.medium;
    }
  }
}

extension TaskCategoryExtension on TaskCategory {
  String get name {
    switch (this) {
      case TaskCategory.all:
        return 'all';
      case TaskCategory.personal:
        return 'personal';
      case TaskCategory.work:
        return 'work';
      case TaskCategory.shopping:
        return 'shopping';
      case TaskCategory.health:
        return 'health';
      case TaskCategory.education:
        return 'education';
      case TaskCategory.other:
        return 'other';
    }
  }

  static TaskCategory fromString(String value) {
    switch (value) {
      case 'all':
        return TaskCategory.all;
      case 'personal':
        return TaskCategory.personal;
      case 'work':
        return TaskCategory.work;
      case 'shopping':
        return TaskCategory.shopping;
      case 'health':
        return TaskCategory.health;
      case 'education':
        return TaskCategory.education;
      case 'other':
        return TaskCategory.other;
      default:
        return TaskCategory.other;
    }
  }
}

extension TaskStatusExtension on TaskStatus {
  String get name {
    switch (this) {
      case TaskStatus.incomplete:
        return 'incomplete';
      case TaskStatus.completed:
        return 'completed';
    }
  }

  static TaskStatus fromString(String value) {
    switch (value) {
      case 'incomplete':
        return TaskStatus.incomplete;
      case 'completed':
        return TaskStatus.completed;
      default:
        return TaskStatus.incomplete;
    }
  }
}
