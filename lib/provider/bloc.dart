import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/categories/categories_list/bloc/bloc.dart';
import '../features/categories/edit_category/bloc/bloc.dart';
import '../features/categories/new_category/bloc/bloc.dart';
import '../features/task/task_chip/bloc/bloc.dart';
import '../features/task/task_discription/bloc/bloc.dart';
import '../features/tasks/new_task/bloc/bloc.dart';
import '../features/tasks/tasks_filter/bloc/bloc.dart';
import '../features/tasks/tasks_list/bloc/bloc.dart';
import 'repository.dart';

final class ProviderBloc {
  ProviderBloc._();

  static final categoriesList = Provider<CategoriesListBloc>(
    (ref) => CategoriesListBloc(
      ref.watch(ProviderRespository.categoriesList),
    ),
  );

  static final tasksList = Provider<TasksListBloc>(
    (ref) => TasksListBloc(
      ref.watch(ProviderRespository.tasksList),
    ),
  );

  static final newTask = Provider<NewTaskBloc>(
    (ref) => NewTaskBloc(
      ref.watch(ProviderRespository.tasksList),
      ref.watch(tasksList),
    ),
  );

  static final tasksFilter = Provider<FilterBloc>(
    (ref) => FilterBloc(
      ref.watch(ProviderRespository.tasksFilter),
      ref.watch(tasksList),
    ),
  );

  static final taskChips = Provider<TaskChipsBloc>(
    (ref) => TaskChipsBloc(
      ref.watch(ProviderRespository.tasksList),
    ),
  );

  static final taskDiscription = Provider<TaskDiscriptionBloc>(
    (ref) => TaskDiscriptionBloc(
      ref.watch(ProviderRespository.tasksList),
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
