import 'model.dart';

abstract class CategoriesListRepository {
  Future<List<CategoryModel>> getCategories();

  Future<void> addCategories(String newCategoryName);

  Future<bool> validateCategories(String newCategoryName);
}
