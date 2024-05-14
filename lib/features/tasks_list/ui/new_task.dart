import 'package:flutter/material.dart';
import 'package:ios/.gen/i18n/strings.g.dart';

class NewTaskButton extends StatelessWidget {
  const NewTaskButton({super.key});

  @override
  Widget build(BuildContext context) => FloatingActionButton.extended(
        onPressed: () {},
        label: Text(t.tasks.newTasks),
        icon: const Icon(Icons.add),
      );
}
