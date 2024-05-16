import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/categories/interface.dart';
import '../repositories/categories/repository.dart';
import '../repositories/tasks/interface.dart';
import '../repositories/tasks/repository.dart';
import 'data.dart';

final class ProviderRespository {
  ProviderRespository._();

  static final categoriesList = Provider<CategoriesListRepository>(
    (ref) => CategoriesListRepositoryImpl(
      ref.watch(ProviderData.categoriesList),
    ),
  );

  static final tasksList = Provider<TasksListRepository>(
    (ref) => TasksListRepositoryImpl(
      ref.watch(ProviderData.tasksList),
    ),
  );
}
