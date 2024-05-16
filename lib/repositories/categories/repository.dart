import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../data/categories/interface.dart';
import 'interface.dart';
import 'model.dart';

class CategoriesListRepositoryImpl extends CategoriesListRepository {
  final List<CategoryModel> categories = [];
  final Uuid uuid = const Uuid();

  final CategoriesSource _categoriesSource;

  CategoriesListRepositoryImpl(this._categoriesSource);

  Future<void> loadCategories() async {
    final loadedCategories = (await _categoriesSource.getCategories()).map(
      (json) => CategoryModel.fromJson(json),
    );

    categories.addAll(loadedCategories);
  }

  @override
  Future<void> addCategory(String newCategoryName) async {
    if (!(await validateCategory(newCategoryName))) {
      return;
    }

    categories.add(
      CategoryModel(
        id: uuid.v1(),
        name: newCategoryName,
        createDate: DateTime.now(),
      ),
    );
  }

  @override
  Future<void> editCategory(String categoryId, String newCategoryName) async {
    final category = categories.firstWhere((c) => c.id == categoryId);

    await deleteCategory(categoryId);

    categories.add(
      CategoryModel(
        id: categoryId,
        name: newCategoryName,
        createDate: category.createDate,
      ),
    );
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    return categories;
  }

  @override
  Future<bool> validateCategory(String newCategoryName) async =>
      categories.where((c) => c.name == newCategoryName).isEmpty;

  @override
  Future<void> deleteCategory(String categoryId) async {
    categories.removeWhere((c) => c.id == categoryId);
  }

  @override
  Future<CategoryModel?> getCategory(String categoryId) async {
    return categories.where((c) => c.id == categoryId).firstOrNull;
  }
}
