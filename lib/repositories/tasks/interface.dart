import 'model.dart';

abstract class TasksListRepository {
  Future<List<TaskModel>> getTasks(String categoryId);

  Future<void> addTask(
    String categoryId,
    String taskName,
    String taskDescription,
  );

  Future<void> editTask(
    String taskId, {
    String? taskName,
    String? taskDescription,
    bool? isCompleted,
    bool? isFavourite,
  });
}
