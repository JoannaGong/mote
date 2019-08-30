import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProvide with ChangeNotifier {
  String token = '';

  changeToken(String token) {
    token = token;
    notifyListeners();
  }

  saveToken(v) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', v);
    notifyListeners();
  }

  Future<String> get(key) async {
    var value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    value = prefs.getString(key);
    return value;
  }
}
