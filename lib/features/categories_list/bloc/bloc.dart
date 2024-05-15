import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../navigation/navigator.dart';
import '../../../repositories/categories/interface.dart';
import '../models/category.dart';
import 'state.dart';

class CategoriesListBloc extends Cubit<CategoriesListState> {
  final CategoriesListRepository _categoriesListRepository;

  CategoriesListBloc(
    this._categoriesListRepository,
  ) : super(const CategoriesListState.loading());

  Future<void> refresh() async {
    emit(const CategoriesListState.loading());

    try {
      final categoryies = (await _categoriesListRepository.getCategories()).map(
        (model) => CategoryViewModel.fromModel(model),
      );
      emit(
        CategoriesListState.loaded(categories: categoryies.toList()),
      );
    } catch (_) {
      emit(
        const CategoriesListState.error(message: ""),
      );
    }
  }

  Future<void> categoryTap(String categoryId) async {
    AppNavigator.openCategoryTasks(categoryId);
  }
}
