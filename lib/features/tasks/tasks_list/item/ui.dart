import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../navigation/navigator.dart';
import '../models/task.dart';
import 'bloc.dart';

class TaskItem extends StatelessWidget {
  final TaskBloc bloc;

  const TaskItem({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskViewModel>(
      bloc: bloc,
      builder: (context, state) => Dismissible(
        key: ValueKey(state.id),
        dismissThresholds: const {
          DismissDirection.startToEnd: 0.4,
          DismissDirection.endToStart: 0.4,
        },
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.startToEnd) {
            bloc.toggleComplete();
          } else {
            bloc.toggleFavorite();
          }

          return false;
        },
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
          leading: Checkbox(value: state.isCompleted, onChanged: (value) {}),
          title: Text(state.title),
          subtitle: state.description.isEmpty ? null : Text(state.description),
          trailing: Icon(
            state.isFavourite ? Icons.star : Icons.star_border,
          ),
          onTap: () => AppNavigator.openTaskPage(state.id),
        ),
      ),
    );
  }
}
