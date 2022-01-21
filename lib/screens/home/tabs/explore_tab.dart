import 'package:flutter/material.dart';
import 'package:food_delivery_app/providers/home_provider.dart';
import 'package:food_delivery_app/shared/components/components.dart';
import 'package:food_delivery_app/shared/data/data.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ExploreTab extends StatelessWidget {
  var carouselController = PageController();
  var breakfastController = PageController();

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, hp, child) => Column(
        children: [
          customAppBar(context: context),
          bannersCarousel(context: context),
          userPreferences(context: context),
          circularItemsList(itemList: preferencesItems),
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: ShapeDecoration(
                  color: const Color.fromRGBO(253, 249, 234, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customHeadline(
                      header: 'Looking for ',
                      specHeader: 'Breakfast?',
                      hColor: const Color.fromRGBO(248, 137, 34, 1),
                      info: 'Here’s what you might like to taste',
                      iColor: const Color.fromRGBO(166, 151, 138, 1),
                    ),
                  ],
                ),
              ),
              customCarouselSlider(
                context: context,
                items: breakfastMeals,
              ),
            ],
          ),
          circularItemsList(itemList: dishes, size: 80),
          //
          customHeadline(
            header: 'Save Rescued Food for 50%!',
            hColor: const Color.fromRGBO(79, 169, 135, 1),
            info: 'Left over supplies and food have been used up.',
            sectionHead: true,
          ),
          customCarouselSlider(
            context: context,
            items: saveMoneyResturants,
            itemBorder: true,
          ),
          //
        ],
      ),
    );
  }

  Widget bannersCarousel({required context}) => Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: PageView.builder(
              allowImplicitScrolling: true,
              itemCount: 4,
              controller: carouselController,
              itemBuilder: (context, i) {
                if (i % 2 == 0)
                  i = 1;
                else
                  i = 2;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {},
                    child: Image.asset(
                      'assets/banners/banner$i.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 15),
          SmoothPageIndicator(
            controller: carouselController,
            count: 4,
            effect: const WormEffect(
              dotColor: Color.fromRGBO(83, 186, 157, 0.4),
              activeDotColor: Color.fromRGBO(77, 187, 172, 1),
              spacing: 6,
              dotHeight: 9,
              dotWidth: 9,
            ),
          )
        ],
      );

  Widget customHeadline({
    required header,
    required info,
    specHeader,
    hColor = Colors.black,
    iColor = const Color.fromRGBO(153, 153, 153, 1),
    bool sectionHead = false,
  }) =>
      Container(
        padding: const EdgeInsetsDirectional.only(top: 20, start: 15, end: 15),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        style: TextStyle(
                          color: hColor,
                          fontSize: 20,
                          fontWeight: specHeader == null
                              ? FontWeight.w900
                              : FontWeight.normal,
                        ),
                        children: [
                          TextSpan(
                            text: header,
                          ),
                          TextSpan(
                            text: specHeader ?? '',
                            style: const TextStyle(fontWeight: FontWeight.w900),
                          )
                        ]),
                  ),
                  Text(
                    info,
                    style: TextStyle(
                      fontSize: 15,
                      color: iColor,
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: sectionHead,
              child: customButton(
                text: 'ALL',
                textColor: const Color.fromRGBO(112, 112, 112, 1),
                border: true,
                height: 40,
                onPressed: () {},
              ),
            ),
          ],
        ),
      );
}
