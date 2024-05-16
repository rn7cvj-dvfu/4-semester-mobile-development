import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repositories/categories/interface.dart';
import '../../categories_list/bloc/bloc.dart';
import 'state.dart';

class EditCategoryBloc extends Cubit<EditCategoryState> {
  final CategoriesListRepository _categoriesListRepository;
  final CategoriesListBloc _categoriesListBloc;

  EditCategoryBloc(
    this._categoriesListRepository,
    this._categoriesListBloc,
  ) : super(const EditCategoryState.waiting());

  Future<bool> validateCategory(String categoryName) async {
    emit(const EditCategoryState.validating());

    final result =
        await _categoriesListRepository.validateCategory(categoryName);

    if (result) {
      emit(const EditCategoryState.waiting());
    } else {
      emit(const EditCategoryState.error());
    }
    return result;
  }

  Future<void> editCategory(String categoryId, String newCategoryName) async {
    await _categoriesListRepository.editCategory(categoryId, newCategoryName);
    _categoriesListBloc.refresh();
  }
}
