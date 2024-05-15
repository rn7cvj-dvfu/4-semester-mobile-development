import 'package:freezed_annotation/freezed_annotation.dart';

part '../../.gen/repositories/categories/model.freezed.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required String id,
    required String name,
    required DateTime createDate,
  }) = _CategoryModel;
}
