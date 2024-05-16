import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repositories/categories/interface.dart';
import '../../categories_list/bloc/bloc.dart';
import 'state.dart';

class NewCategoryBloc extends Cubit<NewCategoryState> {
  final CategoriesListRepository _categoriesListRepository;
  final CategoriesListBloc _categoriesListBloc;

  NewCategoryBloc(
    this._categoriesListRepository,
    this._categoriesListBloc,
  ) : super(const NewCategoryState.waiting());

  Future<void> reset() async {
    emit(const NewCategoryState.waiting());
  }

  Future<bool> validateCategory(String categoryName) async {
    emit(const NewCategoryState.validating());

    final result =
        await _categoriesListRepository.validateCategory(categoryName);

    if (result) {
      emit(const NewCategoryState.waiting());
    } else {
      emit(const NewCategoryState.error());
    }
    return result;
  }

  Future<void> createCategory(String categoryName) async {
    await _categoriesListRepository.addCategory(categoryName);
    _categoriesListBloc.refresh();
  }
}
