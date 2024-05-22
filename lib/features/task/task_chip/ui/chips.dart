import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../.gen/i18n/strings.g.dart';
import '../../../../provider/bloc.dart';
import '../bloc/bloc.dart';
import '../bloc/state.dart';

class TaskChips extends ConsumerWidget {
  const TaskChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(ProviderBloc.taskChips);

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
        stops: [
          0.0,
          16 / rect.width,
          1 - 16 / rect.width,
          1.0,
        ],
      ).createShader(rect),
      blendMode: BlendMode.dstOut,
      child: BlocBuilder<TaskChipsBloc, TaskChipsState>(
        bloc: bloc,
        builder: (context, state) => state.map(
          loading: (_) => const SizedBox.shrink(),
          loaded: (data) => Chips(
            createdAt: data.creationData,
            categoryName: data.categoryName,
            isFavorite: data.isFavorite,
            isDone: data.isCompleted,
          ),
        ),
      ),
    );
  }
}

class Chips extends StatelessWidget {
  const Chips({
    super.key,
    required this.createdAt,
    required this.categoryName,
    required this.isFavorite,
    required this.isDone,
  });

  final DateTime createdAt;
  final String categoryName;
  final bool isFavorite;
  final bool isDone;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: 16),
            Chip(
                label: Text(
                    '${t.chips.created}: ${DateFormat.MMMd().format(createdAt)} , ${DateFormat.Hm().format(createdAt)}')),
            const SizedBox(width: 8),
            Chip(label: Text(categoryName)),
            const SizedBox(width: 8),
            if (isFavorite) Chip(label: Text(t.chips.favorite)),
            if (isFavorite) const SizedBox(width: 8),
            Chip(
              label: Text(
                isDone ? t.chips.completed : t.chips.uncompleted,
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      );
}
