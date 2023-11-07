import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AppStateGetx extends GetxController {
  Rx<bool> isLoggedIn = Rx(false);
  Rx<bool> isCompanySelected = Rx(false);
  int dataValue = 1;

  @override
  void onInit() {
    initLoad();
    super.onInit();
  }

  static AppStateGetx instance = Get.find();

  updateData() {
    dataValue = dataValue + 1;
  }

  initLoad() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedIn.value = prefs.getBool("login") ?? false;
    isCompanySelected.value = prefs.getBool("company") ?? false;
  }

  onLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("login", true);
    isLoggedIn.value = true;
  }

  onLogOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("login", false);
    prefs.setBool("company", false);
    isLoggedIn.value = false;
    isCompanySelected.value = false;
  }

  onSelectCompany() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("company", true);
    isCompanySelected.value = true;
  }

  onRemoveCompany() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("company", false);
    isCompanySelected.value = false;
  }

  String get getDataValue => dataValue.toString();
  bool get getLoginStatus => isLoggedIn.value;
  bool get getCompanyStatus => isCompanySelected.value;
}
