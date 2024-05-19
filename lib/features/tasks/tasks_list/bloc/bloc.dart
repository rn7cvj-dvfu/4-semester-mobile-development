import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repositories/tasks/interface.dart';
import '../item/bloc.dart';
import '../models/task.dart';
import 'state.dart';

class TasksListBloc extends Cubit<TasksListState> {
  String? lastCategoryId;
  final TasksListRepository _tasksListRepository;

  TasksListBloc(this._tasksListRepository)
      : super(const TasksListState.loading());

  Future<void> refreshLastCategory() async {
    if (lastCategoryId != null) {
      await refresh(lastCategoryId!);
    }
  }

  Future<void> refresh(String categoryId) async {
    emit(const TasksListState.loading());
    lastCategoryId = categoryId;
    final categories = await _tasksListRepository.getTasks(categoryId);
    emit(
      TasksListState.loaded(
        categories
            .map(
              (model) => TaskBloc(
                TaskViewModel.fromModel(model),
                _tasksListRepository,
              ),
            )
            .toList(),
      ),
    );
  }
}
