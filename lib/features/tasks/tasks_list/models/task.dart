import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../repositories/tasks/model.dart';

part '../../../../.gen/features/tasks/tasks_list/models/task.freezed.dart';

@freezed
class TaskViewModel with _$TaskViewModel {
  const factory TaskViewModel({
    required String id,
    required String categoryId,
    required String title,
    required String description,
    @Default(false) bool isCompleted,
    @Default(false) bool isFavourite,
    required DateTime createdAt,
  }) = _TaskViewModel;

  factory TaskViewModel.fromModel(TaskModel model) => TaskViewModel(
        id: model.id,
        categoryId: model.categoryId,
        title: model.title,
        description: model.description,
        isCompleted: model.isCompleted,
        isFavourite: model.isFavourite,
        createdAt: model.createdAt,
      );
}
