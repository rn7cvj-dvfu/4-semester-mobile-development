import 'package:uuid/uuid.dart';

import 'interface.dart';
import 'model.dart';

class CategoriesListRepositoryImpl extends CategoriesListRepository {
  final List<CategoryModel> categories = [];
  final Uuid uuid = const Uuid();

  @override
  Future<void> addCategories(String newCategoryName) async {
    if (!(await validateCategories(newCategoryName))) {
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
  Future<List<CategoryModel>> getCategories() async {
    return categories;
  }

  @override
  Future<bool> validateCategories(String newCategoryName) async =>
      categories.where((c) => c.name == newCategoryName).isEmpty;
}
