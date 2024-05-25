import 'package:freezed_annotation/freezed_annotation.dart';
part '../../../../.gen/features/task/edit_task/bloc/state.freezed.dart';

@freezed
class EditTaskState with _$EditTaskState {
  const factory EditTaskState.loading() = _Loading;

  const factory EditTaskState.loaded({
    required String title,
    required String description,
  }) = _Loaded;
}
