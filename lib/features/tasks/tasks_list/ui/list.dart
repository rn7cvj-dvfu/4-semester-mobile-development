import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../.gen/i18n/strings.g.dart';
import '../../../../provider/bloc.dart';
import '../bloc/bloc.dart';
import '../bloc/state.dart';
import '../item/bloc.dart';
import '../item/ui.dart';

class TasksList extends ConsumerWidget {
  final String categoryId;

  const TasksList({
    super.key,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(ProviderBloc.tasksList);

    return RefreshIndicator(
      onRefresh: () async {
        await bloc.refresh(categoryId);
      },
      child: BlocBuilder<TasksListBloc, TasksListState>(
        bloc: bloc,
        builder: (context, state) => state.map(
          loading: (_) => const Center(
            child: CircularProgressIndicator(),
          ),
          loaded: (data) => _TasksList(
            tasks: data.tasks,
          ),
          error: (_) => Center(
            child: Text(
              t.tasks.errorWhileLoading,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ),
    );
  }
}

class _TasksList extends StatelessWidget {
  final List<TaskBloc> tasks;

  const _TasksList({required this.tasks});

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              t.tasks.noTasks,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) => TaskItem(
        bloc: tasks[index],
      ),
    );
  }
}
