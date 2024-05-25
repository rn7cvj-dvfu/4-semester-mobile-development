import 'package:freezed_annotation/freezed_annotation.dart';

import '../item/bloc.dart';

part '../../../../.gen/features/tasks/tasks_list/bloc/state.freezed.dart';

@freezed
class TasksListState with _$TasksListState {
  const factory TasksListState.loading() = _Loading;

  const factory TasksListState.loaded(List<TaskBloc> tasks) = _Loaded;

  const factory TasksListState.error({required String message}) = _Error;
}
