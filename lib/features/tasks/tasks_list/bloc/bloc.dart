import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class TasksListBloc extends Cubit<TasksListState> {
  TasksListBloc() : super(const TasksListState.loading());

  Future<void> refresh() async {
    emit(const TasksListState.loading());
  }
}
