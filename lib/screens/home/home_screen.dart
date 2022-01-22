import 'package:flutter/material.dart';
import 'package:food_delivery_app/providers/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
        builder: (context, hp, child) => Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: hp.homeTabs[hp.currentTabId],
                ),
              ),
              bottomNavigationBar: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(255, 104, 56, 0.15),
                      offset: Offset(0, -3),
                      blurRadius: 30,
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    customBnbItem(
                      text: 'HOME',
                      icon: Icons.explore_outlined,
                      selected: hp.currentTabId == 0 ? true : false,
                      onTap: () => hp.switchTab(0),
                    ),
                    customBnbItem(
                      text: 'OFFERS',
                      icon: Icons.star_outline_rounded,
                      selected: hp.currentTabId == 1 ? true : false,
                      onTap: () => hp.switchTab(1),
                    ),
                    customBnbItem(
                      text: 'CART',
                      icon: Icons.local_mall_outlined,
                      selected: hp.currentTabId == 2 ? true : false,
                      onTap: () => hp.switchTab(2),
                    ),
                    customBnbItem(
                      text: 'ACCOUNT',
                      icon: Icons.person_outline,
                      selected: hp.currentTabId == 3 ? true : false,
                      onTap: () => hp.switchTab(3),
                    ),
                  ],
                ),
              ),
            ));
  }

  customBnbItem({
    required text,
    required icon,
    required bool selected,
    required VoidCallback onTap,
  }) =>
      InkWell(
        onTap: onTap,
        splashFactory: NoSplash.splashFactory,
        child: Visibility(
          visible: selected,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: const Color.fromRGBO(255, 104, 56, 1),
                child: Icon(
                  icon,
                  size: 25,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(255, 104, 56, 1),
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Metropolis',
                ),
              ),
            ],
          ),
          replacement: SizedBox(
            width: 60,
            height: double.infinity,
            child: Icon(
              icon,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
      );
}
