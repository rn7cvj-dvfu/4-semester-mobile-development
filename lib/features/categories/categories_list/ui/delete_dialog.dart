import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../.gen/i18n/strings.g.dart';
import '../../../../provider/bloc.dart';

class DeleateCategoryDialog extends ConsumerWidget {
  final String categoryId;

  const DeleateCategoryDialog({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(ProviderBloc.categoriesList);

    return AlertDialog(
      title: Text(t.categories.deleteCategory),
      content: Text(t.categories.configDeleteCategory),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(t.common.cancel),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
            bloc.deleteCategory(categoryId);
          },
          child: Text(t.common.delete),
        ),
      ],
    );
  }
}
