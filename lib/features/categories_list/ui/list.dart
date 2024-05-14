import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../.gen/i18n/strings.g.dart';
import '../../../navigation/navigator.dart';
import '../models/category.dart';
import 'category_dialog.dart';
import 'delete_dialog.dart';


final List<CategoryViewModel> mockCategories = [
  CategoryViewModel(id: "1", name: "Учеба", createDate: DateTime.now()),
  CategoryViewModel(id: "2", name: "Работа", createDate: DateTime.now()),
  CategoryViewModel(id: "3", name: "ДВФУ", createDate: DateTime.now()),
];

class CategoryList extends ConsumerWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView(
        children: mockCategories
            .map(
              (category) => CategoryItem(category: category),
            )
            .toList(),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});

  final CategoryViewModel category;

  @override
  Widget build(BuildContext context) => Dismissible(
        key: ValueKey(category.id),
        dismissThresholds: const {
          DismissDirection.startToEnd: 0.4,
          DismissDirection.endToStart: 0.4,
        },
        confirmDismiss: (direction) => direction == DismissDirection.endToStart
            ? _openDeleteDialog(context)
            : _openEditDialog(context),
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
          onTap: () =>
              AppNavigator.openCategoryTasks(category.name, category.id),
        ),
      );

  Future<bool?> _openDeleteDialog(BuildContext context) => showDialog<bool?>(
        context: context,
        builder: (_) => const DeleateCategoryDialog(),
      );

  Future<bool?> _openEditDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (_) => CategoryDialog(
        title: t.categories.editCategory,
        onConfirm: (value) {},
      ),
    );
    return false;
  }
}
