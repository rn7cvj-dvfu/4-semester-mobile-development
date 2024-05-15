import 'package:flutter/material.dart';

import '../../../.gen/i18n/strings.g.dart';
import 'category_dialog.dart';

class NewCategoryDialogButton extends StatelessWidget {
  const NewCategoryDialogButton({super.key});

  @override
  Widget build(BuildContext context) => FloatingActionButton.extended(
        onPressed: () => _openNewDialog(context),
        label: Text(t.categories.newCategory),
        icon: const Icon(Icons.add),
      );

  Future<bool?> _openNewDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (_) => CategoryDialog(
        title: t.categories.newCategory,
        onConfirm: (value) {},
      ),
    );
    return false;
  }
}
