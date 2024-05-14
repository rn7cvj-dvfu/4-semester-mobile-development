import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ios/.gen/i18n/strings.g.dart';
import 'package:ios/app.dart';
import 'package:ios/utils/ui.dart';

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
