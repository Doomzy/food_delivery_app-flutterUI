import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/models.dart';
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
          //left over Meals
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
          //prev orders
          customHeadline(
            header: 'Order Again',
            info: 'You Ordered from 17 Restaurants',
            sectionHead: true,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
            height: MediaQuery.of(context).size.height * 0.25,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) => prevOrderItem(
                mWidth: MediaQuery.of(context).size.width,
                order: prevOrders[i],
              ),
              separatorBuilder: (context, i) => const SizedBox(width: 20),
              itemCount: prevOrders.length,
            ),
          ),
          //popular Resturants
          customHeadline(
            header: 'Popular Restaurants ',
            specHeader: 'Nearby',
            info: 'Some of them offer rescued food.',
            sectionHead: true,
          ),
          customCarouselSlider(
            context: context,
            items: popularResturants,
            itemBorder: true,
          ),
          //all Resturants
          customHeadline(
            header: 'All Restaurants ',
            info: '256 Restaurants near you',
            sectionHead: true,
          ),
          const SizedBox(height: 30),
          Column(
            children: allResturants
                .map((e) => restaurentListItem(resturant: e))
                .toList(),
          ),
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

  Widget prevOrderItem({required mWidth, required OrderItem order}) =>
      Container(
        width: mWidth * 0.7,
        padding: const EdgeInsetsDirectional.all(15),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
            side: const BorderSide(
                color: Color.fromRGBO(196, 196, 196, 1), width: 0.5),
          ),
          shadows: const [
            BoxShadow(
              color: Color.fromRGBO(98, 98, 98, 0.07),
              blurRadius: 9,
              spreadRadius: 0,
              offset: Offset(-2.5, 2.5),
            )
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipOval(
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.asset(
                      order.resturantImg,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    cardMainText(text: order.resturantName),
                    cardSecondaryText(text: order.orderTimeDate),
                  ],
                )),
                priceText(
                  price: '\$${order.totalPrice}',
                  color: const Color.fromRGBO(7, 157, 73, 1),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                const SizedBox(
                  width: 70,
                ),
                Expanded(
                  child: Text(
                    order.items.join(', '),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );

  Widget restaurentListItem({required ResturantItem resturant}) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: const BoxDecoration(
            border: Border(
          bottom: BorderSide(
            color: Color.fromRGBO(236, 236, 236, 1),
            width: 0.6,
          ),
        )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: Stack(
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.asset(
                      resturant.img,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Visibility(
                    visible: resturant.closeAt > 10 ? true : false,
                    child: Container(
                      width: 60,
                      height: 60,
                      color: Colors.black.withOpacity(0.5),
                      child: const Center(
                        child: Text(
                          'CLOSED',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: resturant.closeAt > 10 ? true : false,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.watch_later,
                          size: 15,
                          color: Color.fromRGBO(196, 196, 196, 1),
                        ),
                        Text(
                          'Opens at ${resturant.openAt} am',
                          style: const TextStyle(fontSize: 10),
                        ),
                        const SizedBox(height: 20)
                      ],
                    ),
                  ),
                  cardMainText(text: resturant.name),
                  cardSecondaryText(
                    text: resturant.tags.join(', '),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Visibility(
                        visible: resturant.freeDelivery,
                        child: Row(
                          children: [
                            tagText(tag: 'FREE DELIVERY'),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: resturant.rescued,
                        child: Row(
                          children: [
                            tagText(tag: 'RESCUED'),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Visibility(
                    visible: resturant.discount,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.local_offer,
                          color: Colors.orange,
                          size: 20,
                        ),
                        Text(
                          ' ${resturant.discountAmount}% OFF',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.orange,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
