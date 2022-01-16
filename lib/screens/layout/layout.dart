import 'package:flutter/material.dart';
import 'package:food_delivery_app/providers/loginsignup_provider.dart';
import 'package:food_delivery_app/providers/main_provider.dart';
import 'package:food_delivery_app/shared/styles/themes.dart';
import 'package:provider/provider.dart';

class Layout extends StatelessWidget {
  Widget startingWidget;

  Layout({required this.startingWidget});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainProvider>(
          create: (context) => MainProvider()..getPermission(),
        ),
        ChangeNotifierProvider<LoginSignupProvider>(
          create: (context) => LoginSignupProvider()..addTabs(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: defaultTheme,
        home: startingWidget,
      ),
    );
  }
}
