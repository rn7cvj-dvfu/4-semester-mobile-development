import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/tasks/new_task/ui/button.dart';
import '../../features/tasks/tasks_filter/ui/filter_button.dart';
import '../../features/tasks/tasks_list/ui/list.dart';
import '../../provider/bloc.dart';

class TasksPage extends HookConsumerWidget {
  final String categoryName;
  final String categoryId;

  const TasksPage({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(ProviderBloc.tasksList);

    useEffect(() {
      bloc.refresh();
      return null;
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(categoryName),
        actions: const [
          FilterButton(),
        ],
      ),
      body: const TasksList(),
      floatingActionButton: const NewTaskButton(),
      resizeToAvoidBottomInset: false,
    );
  }
}
