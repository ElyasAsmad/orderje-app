import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderje/constants/brand_color.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OrderJeColors.green,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              OutlinedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Back'))
            ],
          ),
        ),
      ),
    );
  }
}
