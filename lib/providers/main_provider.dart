import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/screens/home/home_screen.dart';
import 'package:food_delivery_app/shared/shared_pref/shared_pref.dart';
import 'package:food_delivery_app/shared/utils/utils.dart';

class MainProvider extends ChangeNotifier {
  bool lastOnBoarding = false;

  void onBoardingStatus(b) {
    lastOnBoarding = b;
    notifyListeners();
  }

  void finishOnBoarding(context) {
    CacheHandler.savePref(key: 'onBoarding', value: true);
    navigateToAndRemove(context: context, destination: HomeScreen());
    notifyListeners();
  }
}
