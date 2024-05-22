import 'package:flutter/material.dart';

import 'router.dart';
import 'routes.dart';

final class AppNavigator {
  static BuildContext get context => rootNavigatorKey.currentContext!;

  AppNavigator._();

  static void openCategoryTasks(
    String categoryId,
    String categoryName,
  ) {
    Navigator.of(context).pushNamed(
      RoutesPath.tasks,
      arguments: [categoryId, categoryName],
    );
  }

  static void openTaskPage(
    String taskId,
    String taskName,
  ) {
    Navigator.of(context).pushNamed(
      RoutesPath.task,
      arguments: [taskId, taskName],
    );
  }
}
