import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'interface.dart';

class CategoriesSourceImpl extends CategoriesSource {
  final String _key = "categories";

  @override
  Future<List<Map<String, dynamic>>> getCategories() async {
    final prefs = await SharedPreferences.getInstance();

    final categories = jsonDecode(prefs.getString(_key) ?? "[]");

    return List<Map<String, dynamic>>.from(categories);
  }

  @override
  Future<void> saveCategories(List<Map<String, dynamic>> categories) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString(_key, jsonEncode(categories));
  }
}
