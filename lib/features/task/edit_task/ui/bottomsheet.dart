import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../.gen/i18n/strings.g.dart';
import '../../../../provider/bloc.dart';
import '../bloc/bloc.dart';
import '../bloc/state.dart';

class EditTaskBottomSheet extends ConsumerWidget {
  final String taskId;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  EditTaskBottomSheet({
    super.key,
    required this.taskId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(ProviderBloc.editTask);

    return Material(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: BlocBuilder<EditTaskBloc, EditTaskState>(
        bloc: bloc,
        builder: (context, state) => state.map(
          lodaing: (_) => const SizedBox(
            height: 200,
            width: double.infinity,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          loaded: (data) => _EditTaskBottomSheetContent(
            taskId: taskId,
            taskTitle: data.title,
            taskDescription: data.description,
          ),
        ),
      ),
    );
  }
}

class _EditTaskBottomSheetContent extends ConsumerStatefulWidget {
  final String taskId;
  final String taskTitle;
  final String taskDescription;

  const _EditTaskBottomSheetContent({
    required this.taskId,
    required this.taskTitle,
    required this.taskDescription,
  });

  @override
  ConsumerState<_EditTaskBottomSheetContent> createState() =>
      _EditTaskBottomSheetContentState();
}

class _EditTaskBottomSheetContentState
    extends ConsumerState<_EditTaskBottomSheetContent> {
  late final TextEditingController nameController;

  late final TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.taskTitle);
    descriptionController = TextEditingController(text: widget.taskDescription);
  }

  @override
  Widget build(BuildContext context) {
    final bloc = ref.watch(ProviderBloc.editTask);
    final discriptionBloc = ref.watch(ProviderBloc.taskDiscription);
    final taskListBloc = ref.watch(ProviderBloc.tasksList);

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              t.tasks.editTask,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: t.tasks.title,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: t.tasks.description,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () async {
                  final title = nameController.text;
                  final description = descriptionController.text;

                  await bloc.updateTask(widget.taskId, title, description);
                  discriptionBloc.loadDiscription(widget.taskId);
                  taskListBloc.refreshLastCategory();

                  if (context.mounted) Navigator.of(context).pop();
                },
                icon: const Icon(Icons.edit),
                label: Text(t.tasks.changeTask),
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16 +
                  MediaQuery.of(context).padding.bottom +
                  MediaQuery.of(context).viewInsets.bottom,
            ),
          ],
        ),
      ),
    );
  }
}
