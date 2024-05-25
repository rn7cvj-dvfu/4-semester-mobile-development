import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../.gen/features/task/task_chip/bloc/state.freezed.dart';

@freezed
class TaskChipsState with _$TaskChipsState {
  const factory TaskChipsState.loading() = _Loading;

  const factory TaskChipsState.loaded({
    required DateTime creationData,
    required String categoryName,
    required bool isFavorite,
    required bool isCompleted,
  }) = _Loaded;
}
