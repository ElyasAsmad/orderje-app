class MahallahCafe {
  MahallahCafe({ required this.mahallahName,required this.imageUrl, required this.operatingHour, required this.isOpenNow });

  String mahallahName = '';
  String imageUrl = '';
  String operatingHour = '';
  bool isOpenNow = true;
}

class MahallahCafeData {
  static List<MahallahCafe> mahallahCafeData = [
    MahallahCafe(mahallahName: 'Mahallah Ali Cafe', imageUrl: '/v1675175694/orderje/mahalah_ali_dtjpvh.png', operatingHour: '6:00 am - 11:30 pm', isOpenNow: true),
    MahallahCafe(mahallahName: 'Mahallah Siddiq Cafe', imageUrl: '/v1675175694/orderje/mahalah_ali_dtjpvh.png', operatingHour: '6:00 am - 11:30 pm', isOpenNow: true),
  ];
}
