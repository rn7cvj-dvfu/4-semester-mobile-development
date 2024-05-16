import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/categories/categories_list/bloc/bloc.dart';
import '../features/categories/edit_category/bloc/bloc.dart';
import '../features/categories/new_category/bloc/bloc.dart';
import 'repository.dart';

final class ProviderBloc {
  ProviderBloc._();

  static final categoriesList = Provider<CategoriesListBloc>(
    (ref) => CategoriesListBloc(
      ref.watch(ProviderRespository.categoriesList),
    ),
  );

  static final newCategory = Provider<NewCategoryBloc>(
    (ref) => NewCategoryBloc(
      ref.watch(ProviderRespository.categoriesList),
      ref.watch(categoriesList),
    ),
  );

  static final editCategory = Provider<EditCategoryBloc>(
    (ref) => EditCategoryBloc(
      ref.watch(ProviderRespository.categoriesList),
      ref.watch(categoriesList),
    ),
  );
}
