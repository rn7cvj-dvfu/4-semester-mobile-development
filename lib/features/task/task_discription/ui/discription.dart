import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../.gen/i18n/strings.g.dart';
import '../../../../provider/bloc.dart';
import '../bloc/bloc.dart';
import '../bloc/state.dart';

class TaskDiscription extends ConsumerWidget {
  const TaskDiscription({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(ProviderBloc.taskDiscription);

    return BlocBuilder<TaskDiscriptionBloc, TaskDiscriptionState>(
      bloc: bloc,
      builder: (context, state) => Card(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t.tasks.description,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              state.map(
                loading: (_) => const Center(
                  child: CircularProgressIndicator(),
                ),
                loaded: (data) => Text(
                  data.description,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
