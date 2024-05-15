import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/categories/interface.dart';
import '../repositories/categories/repository.dart';

final class ProviderRespository {
  ProviderRespository._();

  static final categoriesList = Provider<CategoriesListRepository>(
    (_) => CategoriesListRepositoryImpl(),
  );
}
