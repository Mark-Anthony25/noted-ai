enum ReminderPriority { low, medium, high }

class Reminder {
  final String id;
  final String title;
  final String? description;
  final DateTime dueDate;
  final bool isCompleted;
  final ReminderPriority priority;
  final String? category;

  const Reminder({
    required this.id,
    required this.title,
    this.description,
    required this.dueDate,
    this.isCompleted = false,
    this.priority = ReminderPriority.medium,
    this.category,
  });
}
