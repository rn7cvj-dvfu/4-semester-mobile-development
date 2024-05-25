import '../tasks/model.dart';
import 'models.dart';

abstract class TasksFilter {
  Future<List<TaskModel>> filterTasks(List<TaskModel> tasks);

  Future<void> setFilter({
    ShowType? showType,
    SortType? orderType,
  });
}
