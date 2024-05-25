import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../.gen/features/tasks/new_task/bloc/state.freezed.dart';

@freezed
class NewTaskState with _$NewTaskState {
  const factory NewTaskState.waiting() = _Waiting;

  const factory NewTaskState.validating() = _Validating;

  const factory NewTaskState.error() = _Error;
}
