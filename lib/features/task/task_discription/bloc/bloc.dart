import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repositories/tasks/interface.dart';
import 'state.dart';

class TaskDiscriptionBloc extends Cubit<TaskDiscriptionState> {
  final TasksListRepository _tasksListRepository;

  TaskDiscriptionBloc(this._tasksListRepository)
      : super(const TaskDiscriptionState.loading());

  Future<void> loadDiscription(String taskId) async {
    final task = await _tasksListRepository.getTask(taskId);

    emit(TaskDiscriptionState.loaded(
      description: task.description,
    ));
  }
}
