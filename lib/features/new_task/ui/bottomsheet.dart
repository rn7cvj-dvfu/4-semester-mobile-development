import 'package:flutter/material.dart';

import '../../../.gen/i18n/strings.g.dart';

class NewTaskBottomSheet extends StatelessWidget {
  const NewTaskBottomSheet({
    super.key,
    required this.controller,
  });

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              t.tasks.newTasks,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: t.tasks.title,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: t.tasks.description,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: Text(t.tasks.addTask),
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16 + MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
    );
  }
}
