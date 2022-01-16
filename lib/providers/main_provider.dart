import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/location/tabs/map_tab.dart';
import 'package:food_delivery_app/screens/location/tabs/select_tab.dart';

import 'package:food_delivery_app/screens/account/account_screen.dart';
import 'package:food_delivery_app/shared/shared_pref/shared_pref.dart';
import 'package:food_delivery_app/shared/utils/utils.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class MainProvider extends ChangeNotifier {
  bool lastOnBoarding = false;

  void onBoardingStatus(b) {
    lastOnBoarding = b;
    notifyListeners();
  }

  void finishOnBoarding(context) {
    CacheHandler.savePref(key: 'onBoarding', value: true);
    navigateToAndRemove(context: context, destination: AccountScreen());
    notifyListeners();
  }

  List<Widget> locationTabs = [SelectTab(), MapTab()];
  var currentLatLng;
  bool gettingLatLng = false;

  void getPermission() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  void getLatLongOnMap(ll) {
    currentLatLng = ll;
    notifyListeners();
  }

  void openLocationSelection(context, i) {
    if (i == 1) {
      gettingLatLng = true;
      notifyListeners();
      Location().getLocation().then((value) {
        currentLatLng = LatLng(
          value.latitude!.toDouble(),
          value.longitude!.toDouble(),
        );
        gettingLatLng = false;
        notifyListeners();
      });
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      backgroundColor: Colors.transparent,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).copyWith().size.height * 0.85,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            clipBehavior: Clip.hardEdge,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(244, 244, 244, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: locationTabs[i],
          ),
        ),
      ),
    );
  }
}
