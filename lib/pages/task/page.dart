import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../.gen/i18n/strings.g.dart';
import '../../features/task/task_chip/ui/chips.dart';
import '../../features/task/task_discription/ui/discription.dart';
import '../../provider/bloc.dart';

class TaskPage extends HookConsumerWidget {
  final String taskName;
  final String taskId;

  const TaskPage({
    super.key,
    required this.taskName,
    required this.taskId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chipsBloc = ref.watch(ProviderBloc.taskChips);

    useEffect(() {
      chipsBloc.loadTaskChips(taskId);
      return null;
    });

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: min(200.0, MediaQuery.sizeOf(context).height / 5),
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(bottom: 16),
              centerTitle: true,
              title: Text(
                taskName,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
              ),
              background: Container(
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 16),
                const TaskChips(),
                const SizedBox(height: 16),
                const TaskDiscription(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text(t.common.edit),
        icon: const Icon(Icons.edit),
      ),
    );
  }
}
