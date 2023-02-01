import 'package:get/get.dart';

class OrderFoodController extends GetxController {
  var isShowCart = false.obs;
  var tabIndex = 0.obs;

  void toggle() {
    isShowCart.value = !isShowCart.value;
  }

  void setIndex(int index) {
    tabIndex.value = index;
  }
}
