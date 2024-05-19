import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../repositories/filters/models.dart';

part '../../../../.gen/features/tasks/tasks_filter/bloc/state.freezed.dart';

@freezed
class FilterState with _$FilterState {
  const factory FilterState({
    required ShowType showType,
    required SortType sortType,
  }) = _FilterState;
}
