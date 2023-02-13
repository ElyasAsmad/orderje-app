import 'package:get/get.dart';

enum PaymentMethodsAvailable { fpx, creditCard }

class PaymentController extends GetxController {
  var paymentMethodIndex = PaymentMethodsAvailable.fpx.obs;

  void setPaymentMethod(PaymentMethodsAvailable methodIndex) {
    paymentMethodIndex.value = methodIndex;
  }
}
