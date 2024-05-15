import 'package:flutter/material.dart';

import 'router.dart';
import 'routes.dart';

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

  static void openTaskPage(
    String taskId,
  ) {
    Navigator.of(context).pushNamed(
      RoutesPath.task,
      arguments: taskId,
    );
  }
}
