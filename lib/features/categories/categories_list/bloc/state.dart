import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/category.dart';
part '../../../../.gen/features/categories/categories_list/bloc/state.freezed.dart';

@freezed
class CategoriesListState with _$CategoriesListState {
  const factory CategoriesListState.loading() = _Loading;

  const factory CategoriesListState.loaded({
    @Default([]) List<CategoryViewModel> categories,
  }) = _Loaded;

  const factory CategoriesListState.error({
    required String message,
  }) = _Error;
}
