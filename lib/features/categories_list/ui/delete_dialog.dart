import 'package:flutter/material.dart';
import 'package:ios/.gen/i18n/strings.g.dart';

class DeleateCategoryDialog extends StatelessWidget {
  const DeleateCategoryDialog({super.key});

  @override
  Widget build(BuildContext context) {
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
          },
          child: Text(t.common.delete),
        ),
      ],
    );
  }
}
