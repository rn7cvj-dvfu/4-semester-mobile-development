import 'package:flutter/material.dart';

import '../../../../.gen/i18n/strings.g.dart';
import 'bottomsheet.dart';

class NewTaskButton extends StatelessWidget {
  const NewTaskButton({super.key});

  @override
  Widget build(BuildContext context) => FloatingActionButton.extended(
        onPressed: () => _openNewTaskBottomSheet(context),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        label: Text(t.tasks.newTasks),
        icon: const Icon(Icons.add),
      );

  void _openNewTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Wrap(
        children: [
          NewTaskBottomSheet(
            controller: ScrollController(),
          ),
        ],
      ),
      useSafeArea: true,
      isScrollControlled: true,
    );
  }
}
