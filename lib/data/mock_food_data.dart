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
    CafeFood(foodName: 'Nasi Buttermilk Chicken', imageUrl: '/v1675236768/orderje/nasibutter_g0n4fj.png', price: 6.00),
    CafeFood(foodName: 'Nasi Kukus', imageUrl: '/v1674594719/orderje/kukus_owc0m2.png', price: 5.50),
    CafeFood(foodName: 'Nasi Ayam Gepuk', imageUrl: '/v1674594717/orderje/gepuk_dedr85.png', price: 5.50),
  ];
  static List<CafeFood> drinkData = [
    CafeFood(foodName: 'Milo Ais', imageUrl: '/v1675284287/orderje/miloais_im7uod.jpg', price: 3.00),
    CafeFood(foodName: 'Teh Ais', imageUrl: '/v1675284288/orderje/tehais_ayiozf.jpg', price: 2.00),
    CafeFood(foodName: 'Mocha', imageUrl: '/v1675284287/orderje/mocha_ihec6a.jpg', price: 4.00),
  ];
}
