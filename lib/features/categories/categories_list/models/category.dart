import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../repositories/categories/model.dart';
part '../../../../.gen/features/categories/categories_list/models/category.freezed.dart';

@freezed
class CategoryViewModel with _$CategoryViewModel {
  const factory CategoryViewModel({
    required String id,
    required String name,
    required DateTime createDate,
  }) = _CategoryViewModel;

  factory CategoryViewModel.fromModel(CategoryModel model) => CategoryViewModel(
        id: model.id,
        name: model.name,
        createDate: model.createDate,
      );
}
