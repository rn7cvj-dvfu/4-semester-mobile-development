import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/categories/interface.dart';
import '../data/categories/source.dart';

final class ProviderData {
  ProviderData._();

  static final categoriesList = Provider<CategoriesSource>(
    (_) => CategoriesSourceImpl(),
  );
}
