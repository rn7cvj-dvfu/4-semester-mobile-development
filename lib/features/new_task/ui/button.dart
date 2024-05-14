import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ios/.gen/i18n/strings.g.dart';
import 'package:ios/features/new_task/ui/bottomsheet.dart';

class NewTaskButton extends StatelessWidget {
  const NewTaskButton({super.key});

  @override
  Widget build(BuildContext context) => FloatingActionButton.extended(
        onPressed: () => _openNewTaskBottomSheet(context),
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
