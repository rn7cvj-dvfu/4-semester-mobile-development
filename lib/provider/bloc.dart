import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/categories_list/bloc/bloc.dart';
import 'repository.dart';

final class ProviderBloc {
  ProviderBloc._();

  static final categoriesList = Provider<CategoriesListBloc>(
    (ref) => CategoriesListBloc(
      ref.watch(ProviderRespository.categoriesList),
    ),
  );
}
