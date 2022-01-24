import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/providers/home_provider.dart';
import 'package:food_delivery_app/shared/components/components.dart';
import 'package:provider/provider.dart';

class CartTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(255, 75, 58, 1),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsetsDirectional.only(top: 20, bottom: 20),
            width: double.infinity,
            child: circleLogo(name: 'logo1'),
          ),
          Consumer<HomeProvider>(
            builder: (context, hp, child) => Container(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  //Header
                  Row(
                    children: [
                      const Text(
                        'Your Cart',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.shopping_bag_outlined),
                      Text('${hp.myCart.meals.length}')
                    ],
                  ),
                  //location and duration
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(254, 235, 193, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: savedLocation(
                                icon: Icons.home_outlined,
                                locationHeader: 'My House',
                                spacer: 10,
                                locationAddress:
                                    '21-42-34, Banjara Hills, Hyderabad, 500072',
                                onTap: () {},
                              ),
                            ),
                            customButton(
                              text: 'Edit Address',
                              bgColor: Colors.transparent,
                              textColor: Colors.black,
                              height: 20,
                              txtSize: 12,
                              onPressed: () {},
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: savedLocation(
                                icon: Icons.schedule,
                                locationHeader: '30 min',
                                spacer: 10,
                                onTap: () {},
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              'Estimated time',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  //Cart items
                  Column(
                    children: hp.myCart.meals
                        .map((e) => cartItem(context: context, cartMeal: e))
                        .toList(),
                  ),
                  //Promo code
                  Container(
                    clipBehavior: Clip.hardEdge,
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.06),
                          blurRadius: 30.0,
                          spreadRadius: 4,
                          offset: Offset(0.0, 0.75),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: customTextField(
                            hint: 'Enter Promo Code',
                            mBottom: 0,
                            vPadding: 10,
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: customButton(
                            text: 'Apply',
                            textColor: Colors.white,
                            bgColor: const Color.fromRGBO(248, 119, 74, 1),
                            height: 50,
                            bRaduis: 25,
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                  ),
                  //Pilling
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.06),
                          blurRadius: 30.0,
                          spreadRadius: 4,
                          offset: Offset(0.0, 0.75),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            cardMainText(text: 'Subtotal'),
                            const Spacer(),
                            cardSecondaryText(
                                text: '\$${hp.myCart.subTotal()}'),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            cardMainText(text: 'Delivery'),
                            const Spacer(),
                            cardSecondaryText(
                                text: '\$${hp.myCart.deliveryFee}'),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            cardMainText(text: 'Total'),
                            const Spacer(),
                            cardMainText(
                                text:
                                    '\$${hp.myCart.subTotal() + hp.myCart.deliveryFee}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  customButton(
                    text: 'Checkout',
                    onPressed: () {},
                    bgColor: const Color.fromRGBO(248, 119, 74, 1),
                    height: 60,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cartItem({
    required context,
    required CartMeal cartMeal,
  }) {
    var cardWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 20),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            width: cardWidth * 0.2,
            height: cardWidth * 0.2,
            margin: const EdgeInsetsDirectional.only(end: 10),
            child: Image.asset(
              cartMeal.meal.img,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsetsDirectional.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                cardMainText(text: cartMeal.meal.name),
                cardSecondaryText(text: cartMeal.meal.resturant),
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: cardWidth * 0.22,
            padding: const EdgeInsetsDirectional.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: const Color.fromRGBO(248, 119, 74, 1),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Provider.of<HomeProvider>(context, listen: false)
                      .editCartItemQuantity(cartMeal, 'take'),
                  child: const Icon(
                    Icons.remove,
                    color: Color.fromRGBO(248, 119, 74, 1),
                  ),
                ),
                Text(
                  cartMeal.quantity.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
                InkWell(
                  onTap: () => Provider.of<HomeProvider>(context, listen: false)
                      .editCartItemQuantity(cartMeal, 'add'),
                  child: const Icon(
                    Icons.add,
                    color: Color.fromRGBO(248, 119, 74, 1),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 5),
          cardMainText(text: '\$${cartMeal.meal.price * cartMeal.quantity}')
        ],
      ),
    );
  }
}
