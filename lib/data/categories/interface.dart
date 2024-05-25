abstract class CategoriesSource {
  Future<List<Map<String, dynamic>>> getCategories();

  Future<void> saveCategories(List<Map<String, dynamic>> categories);
}
