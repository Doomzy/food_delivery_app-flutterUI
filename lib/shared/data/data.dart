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
    rescued: true,
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

List<OrderItem> prevOrders = [
  OrderItem(
    resturantName: 'KFC',
    resturantImg: 'assets/resturants/resturant2.jpg',
    orderTimeDate: 'Yestrday 3pm',
    totalPrice: 250,
    items: ['1 Cheese Burger', '2 French Fries', '1 Pepsi'],
  ),
  OrderItem(
    resturantName: 'Biryanis and more',
    resturantImg: 'assets/resturants/resturant3.jpg',
    orderTimeDate: '22/05/2021 6pm',
    totalPrice: 250,
    items: ['1 Kacchi biriyani', '1 chilli onion', '1 Fanta'],
  ),
];

List<ResturantItem> popularResturants = [
  ResturantItem(
    name: 'KFC',
    img: 'assets/resturants/resturant1.jpg',
    tags: ['Fast food', 'Fried Chicken'],
    freeDelivery: true,
    discount: true,
    discountAmount: 25,
  ),
  ResturantItem(
    name: 'Burger King',
    img: 'assets/resturants/resturant2.jpg',
    tags: ['Burgers', 'Bevarages'],
  ),
  ResturantItem(
    name: 'Paradise Restaurant',
    img: 'assets/resturants/resturant3.jpg',
    tags: ['Halal Food'],
    freeDelivery: true,
  ),
];

List<ResturantItem> allResturants = [
  ResturantItem(
    name: 'Pizza Hut',
    img: 'assets/resturants/resturant1.jpg',
    tags: [
      'Home cook ',
      'Fast food',
      'Burger',
      'Home cook',
      'Fast food',
      'Burger'
    ],
    freeDelivery: true,
    rescued: true,
    discount: true,
    discountAmount: 50,
  ),
  ResturantItem(
    name: 'Burger King',
    img: 'assets/resturants/resturant2.jpg',
    tags: ['Burgers', 'Bevarages'],
  ),
  ResturantItem(
    name: 'KFC',
    img: 'assets/resturants/resturant3.jpg',
    tags: ['Fast food', 'Fried Chicken'],
    rescued: true,
  ),
  ResturantItem(
    name: 'Paradise Restaurant',
    img: 'assets/resturants/resturant1.jpg',
    tags: ['Halal Food'],
    discount: true,
    discountAmount: 15,
  ),
  ResturantItem(
    name: 'Cream Stone',
    img: 'assets/resturants/resturant1.jpg',
    tags: ['Ice cream', 'Desserts'],
    freeDelivery: true,
    discount: true,
    discountAmount: 25,
    closeAt: 11,
  ),
];

List<MealItem> offersMeals = [
  MealItem(
    name: 'Fried Rice',
    resturant: 'Pista House',
    img: 'assets/resturants/resturant1.jpg',
    totCals: 100,
    price: 100,
    discount: true,
    rescued: true,
    freeDelivery: true,
    oldPrice: 200,
    resturantRating: 4,
  ),
  MealItem(
    name: 'Jollof Rice',
    resturant: 'Suhani’s Stop',
    img: 'assets/resturants/resturant2.jpg',
    totCals: 120,
    price: 75,
    discount: true,
    freeDelivery: true,
    oldPrice: 100,
    resturantRating: 3.5,
  ),
  MealItem(
    name: 'KFC Nuggets',
    resturant: 'KFC',
    img: 'assets/resturants/resturant3.jpg',
    totCals: 145,
    price: 50,
    discount: true,
    oldPrice: 60,
    resturantRating: 5,
  ),
];
