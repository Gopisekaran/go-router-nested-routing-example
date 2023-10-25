import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStates with ChangeNotifier {
  bool isLoggedIn = false;
  bool isCompanySelected = false;

  AppStates(this.isLoggedIn, this.isCompanySelected);

  initLoad() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedIn = prefs.getBool("login") ?? false;
    isCompanySelected = prefs.getBool("company") ?? false;
    notifyListeners();
  }

  onLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("login", true);
    isLoggedIn = true;
    notifyListeners();
  }

  onLogOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("login", false);
    isLoggedIn = false;
    notifyListeners();
  }

  onSelectCompany() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("company", true);
    isCompanySelected = true;
    notifyListeners();
  }

  onRemoveCompany() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("company", false);
    isCompanySelected = false;
  }

  bool get getLoginStatus => isLoggedIn;
  bool get getCompanyStatus => isCompanySelected;
}
