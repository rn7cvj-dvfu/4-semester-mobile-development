import 'package:flutter/material.dart';
import 'package:ios/features/tasks_filter/ui/filter_button.dart';
import 'package:ios/features/tasks_list/ui/list.dart';
import 'package:ios/features/tasks_list/ui/new_task.dart';

class TasksPage extends StatelessWidget {
  final String title;
  final String categoryId;

  const TasksPage({
    super.key,
    required this.title,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title),
          actions: const [
            FilterButton(),
          ],
        ),
        body: const TasksList(),
        floatingActionButton: const NewTaskButton(),
        resizeToAvoidBottomInset: false,
      );
}
