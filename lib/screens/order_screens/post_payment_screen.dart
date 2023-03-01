import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderje/constants/brand_color.dart';
import 'package:orderje/widgets/core/orderje_outlined_button.dart';
import 'package:orderje/widgets/core/orderje_styles.dart';

class PostPaymentScreen extends StatelessWidget {
  const PostPaymentScreen({super.key});

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
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Text(
                          'back',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    const Text(
                      'Receipt',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                      padding: const EdgeInsets.all(20),
                      decoration: OrderJeStyles.generateDecoration(
                          backgroundColor: OrderJeColors.yellow),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.maxFinite,
                              padding: const EdgeInsets.all(20),
                              decoration: OrderJeStyles.generateDecoration(
                                  circularBorder: true,
                                  backgroundColor: OrderJeColors.mainColor,
                                  borderRadius: 30),
                              child: Text('Payment Successful', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          OrderJeOutlinedButton(
                            onTap: () {
                              Get.offAllNamed('/home');
                            },
                            height: 45,
                            borderRadius: 35,
                            backgroundColor: OrderJeColors.red,
                            child: const Text(
                              'Back to Homepage',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      )))
            ])),
      ),
    );
  }
}
