import 'package:flutter/material.dart';
import 'package:ios/.gen/i18n/strings.g.dart';
import 'package:ios/features/categories_list/ui/list.dart';
import 'package:ios/features/categories_list/ui/new_category.dart';

class AllCategoryPage extends StatelessWidget {
  const AllCategoryPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(t.categories.title),
        ),
        body: CategoryList(),
        floatingActionButton: const NewCategoryDialogButton(),
        resizeToAvoidBottomInset: false,
      );
}
