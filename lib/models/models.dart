class CircularItem {
  String text;
  String img;
  CircularItem({required this.text, required this.img});
}

class MealItem {
  String name;
  String resturant;
  String img;
  int price;
  int oldPrice;
  int totCals;
  double resturantRating;
  bool freeDelivery;
  bool discount;
  bool rescued;

  MealItem({
    required this.name,
    required this.resturant,
    required this.img,
    required this.price,
    this.discount = false,
    this.freeDelivery = false,
    this.rescued = false,
    this.oldPrice = 1,
    this.totCals = 120,
    this.resturantRating = 5,
  });
}

class ResturantItem {
  String name;
  String img;
  int discountAmount;
  bool freeDelivery;
  bool rescued;
  bool discount;
  bool opened;
  int openAt;
  int closeAt;
  List<String> tags;

  ResturantItem({
    required this.name,
    required this.img,
    required this.tags,
    this.discount = false,
    this.freeDelivery = false,
    this.rescued = false,
    this.opened = false,
    this.discountAmount = 0,
    this.openAt = 12,
    this.closeAt = 10,
  });
}

class OrderItem {
  String resturantName;
  String resturantImg;
  String orderTimeDate;
  int totalPrice;
  List<String> items;

  OrderItem({
    required this.resturantName,
    required this.resturantImg,
    required this.orderTimeDate,
    required this.totalPrice,
    required this.items,
  });
}

class CartItem {
  int userID;
  List<CartMeal> meals;
  double deliveryFee;

  double subTotal() {
    double temp = 0;
    meals.forEach((e) {
      temp += (e.meal.price * e.quantity).toDouble();
    });
    return temp;
  }

  CartItem({
    required this.userID,
    required this.deliveryFee,
    required this.meals,
  });
}

class CartMeal {
  int quantity;
  MealItem meal;

  CartMeal({
    required this.quantity,
    required this.meal,
  });
}
