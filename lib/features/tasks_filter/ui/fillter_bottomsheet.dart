import 'package:flutter/material.dart';

import '../../../.gen/i18n/strings.g.dart';

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

class _ViewFilter extends StatelessWidget {
  const _ViewFilter();

  @override
  Widget build(BuildContext context) {
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
          DropdownButton<int>(
            isExpanded: true,
            underline: const SizedBox.shrink(),
            value: 1,
            items: [
              DropdownMenuItem(
                value: 1,
                child: Text(t.filter.all),
              ),
              DropdownMenuItem(
                value: 2,
                child: Text(t.filter.complited),
              ),
              DropdownMenuItem(
                value: 3,
                child: Text(t.filter.uncomplited),
              ),
              DropdownMenuItem(
                value: 3,
                child: Text(t.filter.favourite),
              ),
            ],
            onChanged: (value) => {},
          ),
        ],
      ),
    );
  }
}

class _OrderFilter extends StatelessWidget {
  const _OrderFilter();

  @override
  Widget build(BuildContext context) {
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
          DropdownButton<int>(
            isExpanded: true,
            underline: const SizedBox.shrink(),
            value: 1,
            items: [
              DropdownMenuItem(
                value: 1,
                child: Text(t.filter.orderByCreateDate),
              ),
              DropdownMenuItem(
                value: 2,
                child: Text(t.filter.orderByName),
              ),
              DropdownMenuItem(
                value: 3,
                child: Text(t.filter.orderByPriority),
              ),
            ],
            onChanged: (value) => {},
          ),
        ],
      ),
    );
  }
}
