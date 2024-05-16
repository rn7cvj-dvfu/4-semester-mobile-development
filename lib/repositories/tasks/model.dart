import 'package:freezed_annotation/freezed_annotation.dart';

part '../../.gen/repositories/tasks/model.freezed.dart';

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    required String id,
    required String categoryId,
    required String title,
    required String description,
    @Default(false) bool isCompleted,
    @Default(false) bool isFavourite,
    required DateTime createdAt,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}
