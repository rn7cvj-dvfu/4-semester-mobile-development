import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ios/features/tasks_list/models/task.dart';

final List<TaskViewModel> mockTasks = [
  TaskViewModel(
    id: '1',
    title: 'Task 1',
    description: 'Description 1',
    isCompleted: false,
    isFavourite: false,
    createdAt: DateTime.now(),
    categoryId: '1',
  ),
  TaskViewModel(
    id: '2',
    title: 'Task 2',
    description: 'Description 1',
    isCompleted: false,
    isFavourite: false,
    createdAt: DateTime.now(),
    categoryId: '1',
  ),
  TaskViewModel(
    id: '3',
    title: 'Task 3',
    description: 'Description 1',
    isCompleted: false,
    isFavourite: false,
    createdAt: DateTime.now(),
    categoryId: '1',
  ),
];

class TasksList extends HookConsumerWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView(
        children: mockTasks
            .map(
              (task) => TaskItem(task: task),
            )
            .toList(),
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.task});

  final TaskViewModel task;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(task.id),
      dismissThresholds: const {
        DismissDirection.startToEnd: 0.4,
        DismissDirection.endToStart: 0.4,
      },
      confirmDismiss: (direction) async => false,
      background: Container(
        color: Theme.of(context).colorScheme.secondary,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20.0),
        child: Icon(
          Icons.check,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
      secondaryBackground: Container(
        color: Theme.of(context).colorScheme.primary,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20.0),
        child: Icon(
          Icons.star,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      child: ListTile(
        leading: Checkbox(value: task.isCompleted, onChanged: (value) {}),
        title: Text(task.title),
        subtitle: Text(task.description),
        trailing: const Icon(Icons.star_border),
      ),
    );
  }
}
