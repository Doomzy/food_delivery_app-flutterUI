import 'package:flutter/material.dart';
import 'package:food_delivery_app/shared/shared_pref/shared_pref.dart';

import 'screens/account/account_screen.dart';
import 'screens/layout/layout.dart';
import 'screens/onboarding/onboarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHandler.init();
  Widget startingWidget;
  dynamic onBoarding = CacheHandler.getPref(key: 'onBoarding');

  if (onBoarding != null) {
    startingWidget = AccountScreen();
  } else {
    startingWidget = OnboardingScreen();
  }

  runApp(
    Layout(
      startingWidget: startingWidget,
    ),
  );
}
