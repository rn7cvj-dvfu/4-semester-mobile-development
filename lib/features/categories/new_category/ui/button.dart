import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../.gen/i18n/strings.g.dart';
import '../../../../provider/bloc.dart';
import '../../categories_list/bloc/bloc.dart';
import '../../categories_list/bloc/state.dart';
import 'dialog.dart';

class NewCategoryDialogButton extends ConsumerWidget {
  const NewCategoryDialogButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(ProviderBloc.categoriesList);

    return BlocBuilder<CategoriesListBloc, CategoriesListState>(
      bloc: bloc,
      builder: (context, state) => FloatingActionButton.extended(
        onPressed: state.maybeMap(
          loaded: (_) => () => _openNewDialog(context),
          orElse: () => null,
        ),
        label: Text(t.categories.newCategory),
        icon: const Icon(Icons.add),
      ),
    );
  }

  Future<bool?> _openNewDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (_) => NewCategoryDialog(),
    );
    return false;
  }
}
