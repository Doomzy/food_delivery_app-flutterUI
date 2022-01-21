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
  bool freeDelivery;
  bool discount;

  MealItem({
    required this.name,
    required this.resturant,
    required this.img,
    required this.price,
    this.discount = false,
    this.freeDelivery = false,
    this.oldPrice = 1,
  });
}

class ResturantItem {
  String name;
  String img;
  int discountAmount;
  bool freeDelivery;
  bool discount;
  List<String> tags;

  ResturantItem({
    required this.name,
    required this.img,
    required this.tags,
    this.discount = false,
    this.freeDelivery = false,
    this.discountAmount = 0,
  });
}
