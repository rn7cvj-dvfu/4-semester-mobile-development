import 'model.dart';

abstract class TasksListRepository {
  Future<List<TaskModel>> getTasks(String categoryId);
}
