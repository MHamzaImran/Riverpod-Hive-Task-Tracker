import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../models/task.dart';
import '../services/local_storage_service.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  final storageService = LocalStorageService();
  return TaskNotifier(storageService);
});

class TaskNotifier extends StateNotifier<List<Task>> {
  final LocalStorageService _storageService;

  TaskNotifier(this._storageService) : super([]) {
    _loadTasks();
  }

  // Load tasks from Hive
  Future<void> _loadTasks() async {
    final tasks = await _storageService.getTasks();
    state = tasks;
  }

  // Add a new task
  Future<void> addTask(String title, String description) async {
    final newTask = Task(
      id: Uuid().v4(),
      title: title,
      description: description,
    );
    await _storageService.addTask(newTask);
    state = [...state, newTask];  // Update the state
  }

  // Toggle the completion status of a task
  Future<void> toggleCompletion(int index) async {
    final task = state[index];
    final updatedTask = Task(
      id: task.id,
      title: task.title,
      description: task.description,
      isCompleted: !task.isCompleted,
    );
    await _storageService.updateTask(index, updatedTask);
    state = [
      for (final t in state)
        if (t.id == task.id) updatedTask else t,
    ];
  }

  // Delete a task
  Future<void> deleteTask(int index) async {
    await _storageService.deleteTask(index);
    state = state.where((task) => task != state[index]).toList();
  }
}
