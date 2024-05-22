import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../.gen/features/task/task_discription/bloc/state.freezed.dart';

@freezed
class TaskDiscriptionState with _$TaskDiscriptionState {
  const factory TaskDiscriptionState.loading() = _Loading;

  const factory TaskDiscriptionState.loaded({
    required String description,
  }) = _Loaded;
}
