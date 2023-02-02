class FoodPromotion {
  FoodPromotion(
      {required this.url,
      required this.foodName,
      required this.foodPrice,
      required this.location,
      required this.tags});

  String url = '';
  String foodName = '';
  double foodPrice = 0.00;
  String location = '';
  String tags = '';
}

class PromotionData {
  static List<FoodPromotion> foodPromotionsData = [
    FoodPromotion(url: '/v1674594717/orderje/gepuk_dedr85.png', foodName: 'Nasi Ayam Gepuk', foodPrice: 6.50, location: 'Mahallah Bilal', tags: '🔥 Popular Now'),
    FoodPromotion(url: '/v1674594715/orderje/butter_z9qetd.png', foodName: 'Nasi Buttermilk Chicken', foodPrice: 6.00, location: 'Mahallah Nusaibah', tags: '🔥 Popular Now'),
    FoodPromotion(url: '/v1674594719/orderje/kukus_owc0m2.png', foodName: 'Nasi Kukus', foodPrice: 6.00, location: 'Mahallah Ruqayyah', tags: '🔥 Popular Now'),
  ];
}
