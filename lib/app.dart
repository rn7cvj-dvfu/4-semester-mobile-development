import 'package:flutter/material.dart';

import 'features/task/task_page/ui/page.dart';
import 'navigation/router.dart';
import 'navigation/routes.dart';
import 'pages/all_categories/page.dart';
import 'pages/tasks/page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fefu Todo",
      themeMode: ThemeMode.system,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const _Navigator(),
    );
  }
}

class _Navigator extends StatelessWidget {
  const _Navigator();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: rootNavigatorKey,
      initialRoute: RoutesPath.allCategory,
      onGenerateRoute: (settings) => switch (settings.name) {
        RoutesPath.allCategory => MaterialPageRoute(
            builder: (_) => const AllCategoryPage(),
          ),
        RoutesPath.tasks => MaterialPageRoute(
            builder: (_) => TasksPage(
              title: settings.arguments as String,
              categoryId: settings.arguments as String,
            ),
          ),
        RoutesPath.task => MaterialPageRoute(
            builder: (_) => TaskPage(
              taskId: settings.arguments as String,
            ),
          ),
        _ => throw Exception("Route not found: ${settings.name}"),
      },
    );
  }
}
