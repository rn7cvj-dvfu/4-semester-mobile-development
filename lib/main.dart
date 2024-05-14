import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '.gen/i18n/strings.g.dart';
import 'app.dart';
import 'utils/ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpSystemUIOverlay();
  LocaleSettings.useDeviceLocale();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
