import 'package:uuid/uuid.dart';

import '../../data/tasks/interface.dart';
import '../filters/interface.dart';
import 'interface.dart';
import 'model.dart';

class TasksListRepositoryImpl extends TasksListRepository {
  bool _haveBeenInitialized = false;
  late final List<TaskModel> tasks;
  final Uuid uuid = const Uuid();

  final TasksSource _tasksSource;
  final TasksFilter _tasksFilter;

  TasksListRepositoryImpl(
    this._tasksSource,
    this._tasksFilter,
  );

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
      await _loadTasks();
      _haveBeenInitialized = true;
    }

    final t = tasks.where((task) => task.categoryId == categoryId).toList();
    return _tasksFilter.filterTasks(t);
  }

  @override
  Future<TaskModel> getTask(String taskId) async {
    if (!_haveBeenInitialized) {
      await _loadTasks();
      _haveBeenInitialized = true;
    }

    return tasks.firstWhere((task) => task.id == taskId);
  }

  @override
  Future<void> addTask(
    String categoryId,
    String taskName,
    String taskDescription,
  ) async {
    tasks.add(
      TaskModel(
        id: uuid.v1(),
        title: taskName,
        description: taskDescription,
        categoryId: categoryId,
        createdAt: DateTime.now(),
      ),
    );

    _saveTasks();
  }

  @override
  Future<void> editTask(
    String taskId, {
    String? taskName,
    String? taskDescription,
    bool? isCompleted,
    bool? isFavourite,
  }) async {
    final task = tasks.firstWhere((task) => task.id == taskId);

    tasks.remove(task);

    tasks.add(
      task.copyWith(
        title: taskName ?? task.title,
        description: taskDescription ?? task.description,
        isCompleted: isCompleted ?? task.isCompleted,
        isFavourite: isFavourite ?? task.isFavourite,
      ),
    );

    _saveTasks();
  }
}
