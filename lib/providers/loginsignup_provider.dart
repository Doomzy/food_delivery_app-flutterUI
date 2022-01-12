import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/account/tabs/changepass_tab.dart';
import 'package:food_delivery_app/screens/account/tabs/login_tab.dart';
import 'package:food_delivery_app/screens/account/tabs/signup_tab.dart';

class LoginSignupProvider extends ChangeNotifier {
  int currentTab = 0;
  List accTabs = [LoginTab()];
  void addTabs() {
    accTabs.add(signupTab(() => changeTab(0)));
    accTabs.add(changepassTab(() => changeTab(0)));
  }

  void changeTab(t) {
    currentTab = t;
    notifyListeners();
  }
}
