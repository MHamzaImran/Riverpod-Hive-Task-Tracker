import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'task.g.dart';  // This is needed for Hive code generation

@HiveType(typeId: 0)  // Unique typeId for the task model
class Task {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
  });

  // Factory constructor for creating a Task from a map (for data loading)
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      isCompleted: map['isCompleted'] ?? false,
    );
  }

  // Convert a Task to a map for saving to Hive
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
    };
  }
}
