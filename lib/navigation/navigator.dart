import 'package:flutter/material.dart';
import 'package:ios/navigation/router.dart';
import 'package:ios/navigation/routes.dart';

final class AppNavigator {
  static BuildContext get context => rootNavigatorKey.currentContext!;

  static void openCategoryTasks(
    String categoryName,
    String categoryId,
  ) {
    Navigator.of(context).pushNamed(
      RoutesPath.tasks,
      arguments: categoryName,
    );
  }
}
