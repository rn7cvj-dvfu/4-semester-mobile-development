import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repositories/tasks/interface.dart';
import '../../tasks_list/bloc/bloc.dart';
import 'state.dart';

class NewTaskBloc extends Cubit<NewTaskState> {
  final TasksListRepository _taskRepository;
  final TasksListBloc _tasksListBloc;

  NewTaskBloc(
    this._taskRepository,
    this._tasksListBloc,
  ) : super(const NewTaskState.waiting());

  Future<void> addTask(
    String categoryId,
    String taskName,
    String taskDescription,
  ) async {
    emit(const NewTaskState.validating());
    try {
      await _taskRepository.addTask(
        categoryId,
        taskName,
        taskDescription,
      );

      _tasksListBloc.refresh(categoryId);
    } catch (_) {}
  }
}
