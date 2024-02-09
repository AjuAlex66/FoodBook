import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  static Future<SharedPreferences> getPreferences() async =>
      await SharedPreferences.getInstance();
  static saveData(Map data) async {
    SharedPreferences preferences = await getPreferences();
    preferences.setString("data", jsonEncode(data));
  }

  static getData() async {
    SharedPreferences preferences = await getPreferences();
    return preferences.getString('data') ?? "";
  }

  static clearAll() async {
    SharedPreferences preferences = await getPreferences();
    preferences.clear();
  }
}
