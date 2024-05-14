import 'package:flutter/material.dart';
import 'package:ios/.gen/i18n/strings.g.dart';

final _formKey = GlobalKey<FormState>();

class CategoryDialog extends StatefulWidget {
  final String title;
  final String? initialValue;

  final void Function(String) onConfirm;

  final TextEditingController _controller = TextEditingController();

  CategoryDialog({
    super.key,
    required this.title,
    this.initialValue,
    required this.onConfirm,
  });

  @override
  State<CategoryDialog> createState() => _CategoryDialogState();
}

class _CategoryDialogState extends State<CategoryDialog> {
  @override
  void initState() {
    super.initState();
    widget._controller.text = widget.initialValue ?? '';
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text(widget.title),
        content: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.8,
          child: Form(
            key: _formKey,
            child: TextFormField(
              controller: widget._controller,
              decoration: InputDecoration(hintText: t.categories.categoryName),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return t.categories.categoryNameEmpty;
                }
                return null;
              },
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(t.common.cancel),
          ),
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.of(context).pop();
                widget.onConfirm(widget._controller.text);
              }
            },
            child: Text(t.common.apply),
          ),
        ],
      );

  @override
  void dispose() {
    widget._controller.dispose();
    super.dispose();
  }
}
