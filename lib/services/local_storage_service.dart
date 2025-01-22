import 'package:hive_flutter/hive_flutter.dart';
import '../models/task.dart';

class LocalStorageService {
  static const String taskBoxName = 'taskBox';

  // Open the task box
  Future<void> openTaskBox() async {
    await Hive.openBox<Task>(taskBoxName);
  }

  // Add a task to the box
  Future<void> addTask(Task task) async {
    final box = await Hive.openBox<Task>(taskBoxName);
    await box.add(task);
  }

  // Fetch all tasks from the box
  Future<List<Task>> getTasks() async {
    final box = await Hive.openBox<Task>(taskBoxName);
    return box.values.toList();
  }

  // Update a task
  Future<void> updateTask(int index, Task task) async {
    final box = await Hive.openBox<Task>(taskBoxName);
    await box.putAt(index, task);
  }

  // Delete a task
  Future<void> deleteTask(int index) async {
    final box = await Hive.openBox<Task>(taskBoxName);
    await box.deleteAt(index);
  }
}
