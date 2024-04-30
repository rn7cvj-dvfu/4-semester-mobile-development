import 'package:flutter/material.dart';
import 'package:ios/.gen/i18n/strings.g.dart';

final _formKey = GlobalKey<FormState>();

class CategoryDialog extends StatelessWidget {
  CategoryDialog({
    super.key,
    required this.title,
    this.initialValue,
    required this.onConfirm,
  }) {
    _controller = TextEditingController(text: initialValue);
  }

  final String title;
  final String? initialValue;

  final void Function(String) onConfirm;

  late final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.8,
        child: Form(
          key: _formKey,
          child: TextFormField(
            controller: _controller,
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
              onConfirm(_controller.text);
            }
          },
          child: Text(t.common.apply),
        ),
      ],
    );
  }
}
