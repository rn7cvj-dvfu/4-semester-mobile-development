import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'interface.dart';

class TasksSourceImpl extends TasksSource {
  final String _key = "tasks";

  @override
  Future<List<Map<String, dynamic>>> getTasks() async {
    final prefs = await SharedPreferences.getInstance();

    final categories = jsonDecode(prefs.getString(_key) ?? "[]");

    return List<Map<String, dynamic>>.from(categories);
  }

  @override
  Future<void> saveTasks(List<Map<String, dynamic>> tasks) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString(_key, jsonEncode(tasks));
  }
}
