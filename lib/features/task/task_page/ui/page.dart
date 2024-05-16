import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../.gen/i18n/strings.g.dart';

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
                const TaskChips(),
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
    return ShaderMask(
      shaderCallback: (Rect rect) => LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Theme.of(context).colorScheme.secondaryContainer,
          Colors.transparent,
          Colors.transparent,
          Theme.of(context).colorScheme.secondaryContainer,
        ],
        stops: [0.0, 16 / rect.width, 1 - 16 / rect.width, 1.0],
      ).createShader(rect),
      blendMode: BlendMode.dstOut,
      child: const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: 16),
            Chip(label: Text('Создана сегодня в 12:30')),
            SizedBox(width: 8),
            Chip(label: Text('ДВФУ')),
            SizedBox(width: 8),
            Chip(label: Text('Избранное')),
            SizedBox(width: 8),
            Chip(label: Text('Заверенная')),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
