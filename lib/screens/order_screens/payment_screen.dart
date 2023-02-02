import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderje/constants/brand_color.dart';
import 'package:orderje/controllers/payment_controller.dart';
import 'package:orderje/widgets/core/orderje_outlined_button.dart';
import 'package:orderje/widgets/core/orderje_styles.dart';
import 'package:orderje/widgets/payment_overview_card/orderje_payment_overview_card.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  final PaymentController controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: OrderJeColors.green,
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(15),
                          splashColor: OrderJeColors.yellow,
                          onTap: () {
                            Get.back();
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            child: Text(
                              'back',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        const Text(
                          'Payment',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                      decoration: OrderJeStyles.generateDecoration(
                          backgroundColor: OrderJeColors.yellow),
                      child: Column(
                        children: [
                          Expanded(
                            child: PaymentOverviewCard(
                              title: 'Foods',
                              height: double.maxFinite,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: PaymentOverviewCard(
                              title: 'Drinks',
                              height: double.maxFinite,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: double.maxFinite,
                            decoration: OrderJeStyles.generateDecoration(
                              circularBorder: true,
                              borderRadius: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  'Payment Method',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Obx(
                                      () => Expanded(
                                        child: OrderJeOutlinedButton(
                                          onTap: () {
                                            controller.setPaymentMethod(
                                                PaymentMethodsAvailable.fpx);
                                          },
                                          height: 45,
                                          borderRadius: 35,
                                          backgroundColor: controller
                                                      .paymentMethodIndex
                                                      .value ==
                                                  PaymentMethodsAvailable.fpx
                                              ? OrderJeColors.green
                                              : null,
                                          child: const Text(
                                            'FPX',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Obx(() => Expanded(
                                          child: OrderJeOutlinedButton(
                                            onTap: () {
                                              controller.setPaymentMethod(
                                                  PaymentMethodsAvailable
                                                      .creditCard);
                                            },
                                            height: 45,
                                            borderRadius: 35,
                                            backgroundColor: controller
                                                        .paymentMethodIndex
                                                        .value ==
                                                    PaymentMethodsAvailable
                                                        .creditCard
                                                ? OrderJeColors.green
                                                : null,
                                            child: const Text(
                                              'Credit Card',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          OrderJeOutlinedButton(
                            onTap: () {
                              Get.toNamed('/payment/result');
                            },
                            height: 45,
                            borderRadius: 35,
                            backgroundColor: OrderJeColors.purple,
                            child: const Text(
                              'Pay Now',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ]))));
  }
}
