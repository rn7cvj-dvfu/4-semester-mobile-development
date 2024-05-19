import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../.gen/i18n/strings.g.dart';
import '../../../../provider/bloc.dart';
import '../../../../repositories/filters/models.dart';
import '../bloc/bloc.dart';
import '../bloc/state.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height / 2),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ViewFilter(),
                _OrderFilter(),
              ],
            ),
          ),
          OverflowBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(t.common.close),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(t.common.apply),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ViewFilter extends ConsumerWidget {
  const _ViewFilter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(ProviderBloc.tasksFilter);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.filter.displayTasks,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          BlocBuilder<FilterBloc, FilterState>(
            bloc: bloc,
            builder: (context, state) => DropdownButton<ShowType>(
              isExpanded: true,
              underline: const SizedBox.shrink(),
              value: state.showType,
              items: [
                DropdownMenuItem(
                  value: ShowType.all,
                  child: Text(t.filter.all),
                ),
                DropdownMenuItem(
                  value: ShowType.completed,
                  child: Text(t.filter.complited),
                ),
                DropdownMenuItem(
                  value: ShowType.uncompleted,
                  child: Text(t.filter.uncomplited),
                ),
                DropdownMenuItem(
                  value: ShowType.favorite,
                  child: Text(t.filter.favourite),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  bloc.updateShowType(value);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderFilter extends ConsumerWidget {
  const _OrderFilter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(ProviderBloc.tasksFilter);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.filter.orderdTasks,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          BlocBuilder<FilterBloc, FilterState>(
            bloc: bloc,
            builder: (context, state) => DropdownButton<SortType>(
              isExpanded: true,
              underline: const SizedBox.shrink(),
              value: state.sortType,
              items: [
                DropdownMenuItem(
                  value: SortType.created,
                  child: Text(t.filter.orderByCreateDate),
                ),
                DropdownMenuItem(
                  value: SortType.title,
                  child: Text(t.filter.orderByName),
                ),
                DropdownMenuItem(
                  value: SortType.favorite,
                  child: Text(t.filter.orderByPriority),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  bloc.updateSortType(value);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
