import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../.gen/i18n/strings.g.dart';
import '../../features/categories/categories_list/ui/list.dart';
import '../../features/categories/new_category/ui/button.dart';
import '../../provider/bloc.dart';

class AllCategoryPage extends HookConsumerWidget {
  const AllCategoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(ProviderBloc.categoriesList);

    useEffect(() {
      bloc.refresh();
      return null;
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(t.categories.title),
      ),
      body: const CategoryList(),
      floatingActionButton: const NewCategoryDialogButton(),
      resizeToAvoidBottomInset: false,
    );
  }
}
