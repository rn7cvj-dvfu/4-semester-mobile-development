import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../.gen/features/categories/edit_category/bloc/state.freezed.dart';

@freezed
class EditCategoryState with _$EditCategoryState {
  const factory EditCategoryState.waiting() = _Waiting;

  const factory EditCategoryState.validating() = _Validating;

  const factory EditCategoryState.error() = _Error;
}
