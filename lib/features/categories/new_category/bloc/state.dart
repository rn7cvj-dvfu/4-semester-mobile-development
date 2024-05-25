import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../.gen/features/categories/new_category/bloc/state.freezed.dart';

@freezed
class NewCategoryState with _$NewCategoryState {
  const factory NewCategoryState.waiting() = _Waiting;

  const factory NewCategoryState.validating() = _Validating;

  const factory NewCategoryState.error() = _Error;
}
