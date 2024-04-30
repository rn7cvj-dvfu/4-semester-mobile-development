import 'package:flutter/material.dart';
import 'package:ios/.gen/i18n/strings.g.dart';
import 'package:ios/features/tasks_filter/ui/filter_button.dart';
import 'package:ios/features/tasks_list/ui/list.dart';
import 'package:ios/features/tasks_list/ui/new_task.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({
    super.key,
    required this.title,
    required this.categoryId,
  });

  final String? title;
  final String? categoryId;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title ?? t.tasks.fallbackTitle),
          actions: const [
            FilterButton(),
          ],
        ),
        body: const TasksList(),
        floatingActionButton: const NewTaskButton(),
        resizeToAvoidBottomInset: false,
      );
}
