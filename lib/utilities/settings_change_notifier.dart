
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project/utilities/constants.dart' as Constants;


class SettingsChangeNotifier extends ChangeNotifier {
  String userName;
  bool language = true; // true -> en, false -> hu
  SettingsChangeNotifier({this.userName, this.language});

  String get getUserName => userName;
  bool get isEnglish => language;

  void toggleLanguage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    language = !language;
    sharedPreferences.setBool(Constants.LANGUAGE_KEY, language);
    notifyListeners();
  }

  void setUserName(String username) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userName = username;
    sharedPreferences.setString(Constants.USER_NAME_KEY, userName);
    notifyListeners();
  }
}
