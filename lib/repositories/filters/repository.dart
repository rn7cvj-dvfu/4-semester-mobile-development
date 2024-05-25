import '../tasks/model.dart';
import 'interface.dart';
import 'models.dart';

class TasksFilterImpl extends TasksFilter {
  ShowType _showType = ShowType.all;

  SortType _sortType = SortType.title;

  @override
  Future<List<TaskModel>> filterTasks(List<TaskModel> tasks) async {
    final filteredTasks = tasks.where(_filterFunction()).toList();
    filteredTasks.sort(_sortFunction());

    return filteredTasks;
  }

  @override
  Future<void> setFilter({
    ShowType? showType,
    SortType? orderType,
  }) async {
    _showType = showType ?? _showType;
    _sortType = orderType ?? _sortType;
  }

  bool Function(TaskModel) _filterFunction() => switch (_showType) {
        ShowType.all => (_) => true,
        ShowType.completed => (task) => task.isCompleted,
        ShowType.uncompleted => (task) => !task.isCompleted,
        ShowType.favorite => (task) => task.isFavourite,
      };

  int Function(TaskModel, TaskModel) _sortFunction() => switch (_sortType) {
        SortType.title => (a, b) => a.title.compareTo(b.title),
        SortType.created => (a, b) => a.createdAt.compareTo(b.createdAt),
        SortType.favorite => (a, b) => a.isFavourite ? -1 : 1,
      };
}
