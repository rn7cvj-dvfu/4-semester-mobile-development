import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repositories/tasks/interface.dart';
import 'state.dart';

class EditTaskBloc extends Cubit<EditTaskState> {
  final TasksListRepository _taskRepository;

  EditTaskBloc(this._taskRepository) : super(const EditTaskState.loading());

  Future<void> fetchTask(String taskId) async {
    emit(const EditTaskState.loading());
    final task = await _taskRepository.getTask(taskId);
    emit(EditTaskState.loaded(
      title: task.title,
      description: task.description,
    ));
  }

  Future<void> updateTask(
    String taskId,
    String title,
    String description,
  ) async {
    await _taskRepository.editTask(
      taskId,
      taskName: title,
      taskDescription: description,
    );
  }
}
