import 'package:food_delivery_app/models/models.dart';

List<CircularItem> preferencesItems = [
  CircularItem(text: 'Hot Deals', img: 'assets/preferences/pref1.png'),
  CircularItem(text: 'New on FastFood', img: 'assets/preferences/pref2.png'),
  CircularItem(
      text: 'Save Food, Save Hunger', img: 'assets/preferences/pref3.png'),
  CircularItem(
      text: 'Set Your Preferences Now!', img: 'assets/preferences/pref4.png'),
];

List<CircularItem> dishes = [
  CircularItem(text: 'Daily Meals', img: 'assets/meals/dish1.png'),
  CircularItem(text: 'Seafood', img: 'assets/meals/dish2.png'),
  CircularItem(text: 'Dessert', img: 'assets/meals/dish3.png'),
  CircularItem(text: 'Italian', img: 'assets/meals/dish4.png'),
];

List<MealItem> breakfastMeals = [
  MealItem(
    name: 'Egg and cheese sandwich',
    resturant: 'Mehfil\'s Place',
    img: 'assets/meals/meal2.png',
    price: 20,
    freeDelivery: true,
  ),
  MealItem(
    name: 'Cappuccino',
    resturant: 'Suhani Restaurant',
    img: 'assets/meals/meal1.png',
    price: 20,
    oldPrice: 25,
    discount: true,
  ),
  MealItem(
    name: 'Strawberry Icecream',
    resturant: 'Cream Stone',
    img: 'assets/meals/meal3.png',
    price: 5,
    oldPrice: 10,
    discount: true,
    freeDelivery: true,
  ),
];

List<ResturantItem> saveMoneyResturants = [
  ResturantItem(
    name: 'Wow! Momo',
    img: 'assets/resturants/resturant1.jpg',
    tags: ['Fast food', 'Chinese'],
    freeDelivery: true,
    discount: true,
    discountAmount: 50,
  ),
  ResturantItem(
    name: 'Istah - Shawarma',
    img: 'assets/resturants/resturant2.jpg',
    tags: ['Arabian', 'Lebanese'],
    discount: true,
    discountAmount: 50,
  ),
  ResturantItem(
    name: 'Biryanis and more',
    img: 'assets/resturants/resturant3.jpg',
    tags: ['Hyderabadi', 'North Indian'],
    discount: true,
    discountAmount: 50,
  ),
];
