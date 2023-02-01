class CafeFood {
  CafeFood(
    {required this.foodName,
      required this.imageUrl,
      required this.price
    });

  String foodName;
  String imageUrl;
  double price;
}

class CafeFoodData {
  static List<CafeFood> foodData = [
    CafeFood(foodName: 'Nasi Buttermilk Chicken', imageUrl: 'https://res.cloudinary.com/grephyn/image/upload/v1675236768/orderje/nasibutter_g0n4fj.png', price: 6.00),
    CafeFood(foodName: 'Nasi Kukus', imageUrl: 'https://res.cloudinary.com/grephyn/image/upload/v1674594719/orderje/kukus_owc0m2.png', price: 5.50),
    CafeFood(foodName: 'Nasi Ayam Gepuk', imageUrl: 'https://res.cloudinary.com/grephyn/image/upload/v1674594717/orderje/gepuk_dedr85.png', price: 5.50),
  ];
}
