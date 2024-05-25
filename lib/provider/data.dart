import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/categories/interface.dart';
import '../data/categories/source.dart';
import '../data/tasks/interface.dart';
import '../data/tasks/source.dart';

final class ProviderData {
  ProviderData._();

  static final categoriesList = Provider<CategoriesSource>(
    (_) => CategoriesSourceImpl(),
  );

  static final tasksList = Provider<TasksSource>(
    (_) => TasksSourceImpl(),
  );
}
