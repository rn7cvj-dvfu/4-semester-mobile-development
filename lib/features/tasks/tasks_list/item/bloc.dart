import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repositories/tasks/interface.dart';
import '../models/task.dart';

class TaskBloc extends Cubit<TaskViewModel> {
  final TasksListRepository _tasksListRepository;

  TaskBloc(super.initialState, this._tasksListRepository);

  Future<void> toggleComplete() async {
    emit(state.copyWith(isCompleted: !state.isCompleted));
    _tasksListRepository.editTask(state.id, isCompleted: state.isCompleted);
  }

  Future<void> toggleFavorite() async {
    emit(state.copyWith(isFavourite: !state.isFavourite));
    _tasksListRepository.editTask(state.id, isFavourite: state.isFavourite);
  }
}
