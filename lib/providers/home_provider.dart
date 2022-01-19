import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/screens/home/tabs/account_tab.dart';
import 'package:food_delivery_app/screens/home/tabs/cart_tab.dart';
import 'package:food_delivery_app/screens/home/tabs/explore_tab.dart';
import 'package:food_delivery_app/screens/home/tabs/offers_tab.dart';

class HomeProvider extends ChangeNotifier {
  int currentTabId = 0;
  List<Widget> homeTabs = [ExploreTab(), OffersTab(), CartTab(), AccountTab()];

  void switchTab(i) {
    currentTabId = i;
    notifyListeners();
  }
}
