import 'model.dart';

abstract class CategoriesListRepository {
  Future<List<CategoryModel>> getCategories();

  Future<void> editCategory(String categoryId, String newCategoryName);

  Future<CategoryModel?> getCategory(String categoryId);

  Future<void> addCategory(String newCategoryName);

  Future<void> deleteCategory(String categoryId);

  Future<bool> validateCategory(String newCategoryName);
}
