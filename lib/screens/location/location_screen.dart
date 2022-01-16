import 'package:flutter/material.dart';
import 'package:food_delivery_app/providers/main_provider.dart';
import 'package:food_delivery_app/screens/home/home_screen.dart';
import 'package:food_delivery_app/shared/components/components.dart';
import 'package:food_delivery_app/shared/utils/utils.dart';
import 'package:provider/provider.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 75, 58, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0),
        elevation: 0,
        actions: [
          MaterialButton(
            onPressed: () => navigateTo(
              context: context,
              destination: HomeScreen(),
            ),
            child: const Text(
              'Skip >>',
              style: TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(255, 255, 255, 0.6),
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: Consumer<MainProvider>(
        builder: (context, mp, child) => SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: circleLogo(scale: 150)),
                const SizedBox(height: 55),
                const Text(
                  'Welcome, Sumanya!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Metropolis',
                    fontSize: 55,
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Unlock the world of regular and rescued food by setting up your delivery address.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.6),
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 100),
                const Text(
                  'SELECT LOCATION ',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.6),
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 25),
                customButton(
                  text: 'Locate Me',
                  onPressed: () => mp.openLocationSelection(context, 1),
                ),
                const SizedBox(height: 25),
                customButton(
                  text: 'Provide Delivery Location',
                  onPressed: () => mp.openLocationSelection(context, 0),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
