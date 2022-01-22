import 'package:flutter/material.dart';
import 'package:food_delivery_app/providers/main_provider.dart';
import 'package:food_delivery_app/screens/home/home_screen.dart';
import 'package:food_delivery_app/shared/components/components.dart';
import 'package:food_delivery_app/shared/utils/utils.dart';
import 'package:provider/provider.dart';

import 'package:flutter_map/flutter_map.dart';

class MapTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, mp, child) => Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.57,
                child: Visibility(
                  visible: mp.gettingLatLng,
                  child: const Center(child: CircularProgressIndicator()),
                  replacement: FlutterMap(
                    options: MapOptions(
                      onTap: (tp, ll) => mp.getLatLongOnMap(ll),
                      center: mp.currentLatLng,
                      zoom: 20.0,
                    ),
                    layers: [
                      TileLayerOptions(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c'],
                      ),
                      MarkerLayerOptions(
                        markers: [
                          Marker(
                            width: 80.0,
                            height: 80.0,
                            point: mp.currentLatLng,
                            builder: (ctx) => Container(
                              child: const Icon(
                                Icons.room,
                                size: 50,
                                color: Color.fromRGBO(220, 118, 78, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              deliverToBtn(
                context: context,
                onPressed: () {
                  Navigator.pop(context);
                  mp.openLocationSelection(context, 0);
                },
              ),
            ],
          ),
          Container(
            margin: EdgeInsetsDirectional.only(
                top: MediaQuery.of(context).size.height * 0.529),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
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
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(Icons.edit, color: Color.fromRGBO(141, 141, 141, 1)),
                savedLocation(
                  icon: Icons.home_outlined,
                  locationHeader: 'Your Home',
                  locationAddress: '21-42-34, Banjara Hills, Hyderabad, 500072',
                  onTap: () {},
                ),
                const SizedBox(height: 30),
                customButton(
                  onPressed: () => navigateToAndRemove(
                    context: context,
                    destination: HomeScreen(),
                  ),
                  text: 'Confirm Location',
                  bgColor: const Color.fromRGBO(248, 119, 74, 1),
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget deliverToBtn({required context, required VoidCallback onPressed}) =>
      Container(
        width: MediaQuery.of(context).size.width * 0.32,
        margin: const EdgeInsetsDirectional.only(top: 30, start: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: MaterialButton(
          padding: const EdgeInsets.all(12),
          onPressed: onPressed,
          child: Row(
            children: const [
              Icon(Icons.arrow_back_ios),
              Spacer(),
              Text(
                'Deliver to',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );
}
