import 'package:uuid/uuid.dart';

import '../../data/tasks/interface.dart';
import 'interface.dart';
import 'model.dart';

class TasksListRepositoryImpl extends TasksListRepository {
  bool _haveBeenInitialized = false;
  late final List<TaskModel> tasks;
  final Uuid uuid = const Uuid();

  final TasksSource _tasksSource;

  TasksListRepositoryImpl(this._tasksSource);

  Future<void> _loadTasks() async {
    final loadedTasks = (await _tasksSource.getTasks()).map(
      (json) => TaskModel.fromJson(json),
    );

    tasks = loadedTasks.toList();
  }

  Future<void> _saveTasks() async {
    await _tasksSource.saveTasks(
      tasks.map((c) => c.toJson()).toList(),
    );
  }

  @override
  Future<List<TaskModel>> getTasks(String categoryId) async {
    if (!_haveBeenInitialized) {
      _loadTasks();
      _haveBeenInitialized = true;
    }

    return tasks.where((task) => task.categoryId == categoryId).toList();
  }
}
