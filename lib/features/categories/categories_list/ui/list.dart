import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../.gen/i18n/strings.g.dart';
import '../../../../navigation/navigator.dart';
import '../../../../provider/bloc.dart';
import '../../edit_category/ui/dialog.dart';
import '../bloc/bloc.dart';
import '../bloc/state.dart';
import '../models/category.dart';

import 'delete_dialog.dart';

class CategoryList extends ConsumerWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(ProviderBloc.categoriesList);

    return RefreshIndicator(
      onRefresh: bloc.refresh,
      child: BlocBuilder<CategoriesListBloc, CategoriesListState>(
        bloc: bloc,
        builder: (context, state) => state.map(
          loading: (_) => Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          loaded: (data) => CategoriesList(
            categories: data.categories,
          ),
          error: (_) => Center(
            child: Text(
              t.categories.erorrWhileLoading,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ),
    );
  }
}

class CategoriesList extends ConsumerWidget {
  final List<CategoryViewModel> categories;

  const CategoriesList({super.key, required this.categories});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(ProviderBloc.categoriesList);

    if (categories.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              t.categories.noCategories,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            TextButton(
              onPressed: bloc.refresh,
              child: Text(t.common.refresh),
            )
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) => CategoryItem(
        category: categories[index],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final CategoryViewModel category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) => Dismissible(
        key: ValueKey(category.id),
        dismissThresholds: const {
          DismissDirection.startToEnd: 0.4,
          DismissDirection.endToStart: 0.4,
        },
        confirmDismiss: (direction) => direction == DismissDirection.endToStart
            ? _openDeleteDialog(context, category.id)
            : _openEditDialog(context, category.id, category.name),
        background: Container(
          color: Theme.of(context).colorScheme.secondary,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 20.0),
          child: Icon(
            Icons.edit,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        secondaryBackground: Container(
          color: Theme.of(context).colorScheme.primary,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20.0),
          child: Icon(
            Icons.delete,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        child: ListTile(
          leading: const Icon(Icons.list_alt),
          title: Text(category.name),
          onTap: () => AppNavigator.openCategoryTasks(category.id),
        ),
      );

  Future<bool?> _openDeleteDialog(BuildContext context, String categoryId) =>
      showDialog<bool?>(
        context: context,
        builder: (_) => DeleateCategoryDialog(
          categoryId: categoryId,
        ),
      );

  Future<bool?> _openEditDialog(
    BuildContext context,
    String categoryId,
    String categoryName,
  ) async {
    showDialog(
      context: context,
      builder: (_) => EditCategoryDialog(
        categoryId: categoryId,
        initialCategoryName: categoryName,
      ),
    );
    return false;
  }
}
