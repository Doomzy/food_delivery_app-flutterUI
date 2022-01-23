import 'package:flutter/material.dart';
import 'package:food_delivery_app/shared/components/components.dart';
import 'package:food_delivery_app/shared/data/data.dart';

class OffersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customAppBar(context: context),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              Image.asset('assets/banners/banner1-big.png'),
              const SizedBox(height: 20),
              const Divider(),
              Column(
                children: offersMeals
                    .map((e) =>
                        carouselHorizontalItem(context: context, item: e))
                    .toList(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
