import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../.gen/i18n/strings.g.dart';
import '../../../../provider/bloc.dart';
import 'bottomsheet.dart';

class EditTaskButton extends ConsumerWidget {
  final String taskId;

  const EditTaskButton({super.key, required this.taskId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(ProviderBloc.editTask);

    return FloatingActionButton.extended(
      onPressed: () {
        bloc.fetchTask(taskId);
        _openEditTaskBottomSheet(context);
      },
      label: Text(t.common.edit),
      icon: const Icon(Icons.edit),
    );
  }

  void _openEditTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Wrap(
        children: [
          EditTaskBottomSheet(
            taskId: taskId,
          ),
        ],
      ),
      useSafeArea: true,
      isScrollControlled: true,
    );
  }
}
