import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repositories/filters/interface.dart';
import '../../../../repositories/filters/models.dart';
import '../../tasks_list/bloc/bloc.dart';
import 'state.dart';

class FilterBloc extends Cubit<FilterState> {
  final TasksFilter _tasksFilter;
  final TasksListBloc _tasksListBloc;

  FilterBloc(
    this._tasksFilter,
    this._tasksListBloc,
  ) : super(const FilterState(
          showType: ShowType.all,
          sortType: SortType.title,
        ));

  Future<void> updateShowType(ShowType showType) async {
    emit(state.copyWith(showType: showType));
    await _tasksFilter.setFilter(showType: showType);
    await _tasksListBloc.refreshLastCategory();
  }

  Future<void> updateSortType(SortType sortType) async {
    emit(state.copyWith(sortType: sortType));
    await _tasksFilter.setFilter(orderType: sortType);
    await _tasksListBloc.refreshLastCategory();
  }
}
