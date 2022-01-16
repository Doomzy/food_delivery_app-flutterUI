import 'package:flutter/material.dart';
import 'package:food_delivery_app/providers/main_provider.dart';
import 'package:food_delivery_app/shared/components/components.dart';
import 'package:provider/provider.dart';

class SelectTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
        builder: (context, mp, child) => Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shadows: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.06),
                        blurRadius: 26.0,
                        spreadRadius: 10,
                        offset: Offset(0.0, 0.75),
                      )
                    ],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Deliver to',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 30),
                      customTextField(
                        hint: 'Search Location',
                        prefix: const Icon(Icons.search),
                        bgColor: const Color.fromRGBO(244, 244, 244, 1),
                      ),
                      savedLocation(
                        icon: Icons.home_outlined,
                        locationHeader: 'Your Home',
                        locationAddress:
                            '21-42-34, Banjara Hills, Hyderabad, 500072',
                        onTap: () => {},
                      ),
                      const SizedBox(height: 35),
                      savedLocation(
                        icon: Icons.room_outlined,
                        locationHeader: 'Current Location',
                        locationAddress:
                            '21-42-34, Banjara Hills, Hyderabad, 500072',
                        onTap: () => {},
                      ),
                      const SizedBox(height: 35),
                      savedLocation(
                        icon: Icons.map_outlined,
                        locationHeader: 'Look up the map',
                        onTap: () {
                          Navigator.pop(context);
                          mp.openLocationSelection(context, 1);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Saved Addresses',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(117, 117, 117, 1),
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Edit',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(117, 117, 117, 1),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          savedAddressBtn(text: 'HOME', icon: Icons.home),
                          const Spacer(),
                          savedAddressBtn(text: 'OFFICE', icon: Icons.work),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ));
  }

  Widget savedAddressBtn({
    required text,
    required icon,
  }) =>
      MaterialButton(
        color: Colors.white,
        textColor: const Color.fromRGBO(46, 58, 89, 1),
        minWidth: 110,
        height: 95,
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Icon(icon, size: 45),
            Text(text),
          ],
        ),
      );
}
