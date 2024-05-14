import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ios/.gen/i18n/strings.g.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key, required this.taskId});

  final String taskId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: min(200.0, MediaQuery.sizeOf(context).height / 5),
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(bottom: 16),
              centerTitle: true,
              title: Text('Task Page $taskId',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      )),
              background: Container(
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 16),
                TaskChips(),
                const SizedBox(height: 16),
                Card(
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
                        Text(
                          'Description for task ID: $taskId',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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

class TaskChips extends StatelessWidget {
  const TaskChips({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Wrap(
        spacing: 8,
        children: [
          Chip(label: Text('Создана сегодня в 12:30')),
          Chip(label: Text('ДВФУ')),
          Chip(label: Text('Избранное')),
          Chip(label: Text('Заверенная')),
        ],
      ),
    );
  }
}
