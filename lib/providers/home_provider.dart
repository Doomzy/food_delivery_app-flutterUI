import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/screens/home/tabs/account_tab.dart';
import 'package:food_delivery_app/screens/home/tabs/cart_tab.dart';
import 'package:food_delivery_app/screens/home/tabs/explore_tab.dart';
import 'package:food_delivery_app/screens/home/tabs/offers_tab.dart';
import 'package:food_delivery_app/shared/data/data.dart';

class HomeProvider extends ChangeNotifier {
  int currentTabId = 0;
  List<Widget> homeTabs = [ExploreTab(), OffersTab(), CartTab(), AccountTab()];

  void switchTab(i) {
    currentTabId = i;
    notifyListeners();
  }

  CartItem myCart = CartItem(
    userID: 1,
    deliveryFee: 50,
    meals: [
      CartMeal(
        quantity: 2,
        meal: MealItem(
          name: 'KFC Nuggets',
          resturant: 'KFC',
          img: 'assets/resturants/resturant3.jpg',
          price: 50,
        ),
      ),
      CartMeal(
        quantity: 1,
        meal: MealItem(
          name: 'Jollof Rice',
          resturant: 'Suhani’s Stop',
          img: 'assets/resturants/resturant2.jpg',
          price: 75,
        ),
      )
    ],
  );

  void editCartItemQuantity(meal, op) {
    int cartMealId = myCart.meals.indexOf(meal);
    if (op == 'add') {
      myCart.meals[cartMealId].quantity += 1;
    } else {
      myCart.meals[cartMealId].quantity == 1
          ? true
          : myCart.meals[cartMealId].quantity -= 1;
    }
    notifyListeners();
  }
}
