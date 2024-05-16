abstract class TasksSource {
  Future<List<Map<String, dynamic>>> getTasks();

  Future<void> saveTasks(List<Map<String, dynamic>> tasks);
}
