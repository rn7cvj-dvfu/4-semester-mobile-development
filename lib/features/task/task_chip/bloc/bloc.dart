import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repositories/tasks/interface.dart';
import 'state.dart';

class TaskChipsBloc extends Cubit<TaskChipsState> {
  final TasksListRepository _tasksListRepository;

  TaskChipsBloc(this._tasksListRepository)
      : super(const TaskChipsState.loading());

  Future<void> loadTaskChips(String taskId) async {
    final task = await _tasksListRepository.getTask(taskId);

    emit(TaskChipsState.loaded(
      creationData: task.createdAt,
      categoryName: 'Category',
      isFavorite: task.isFavourite,
      isCompleted: task.isCompleted,
    ));
  }
}
