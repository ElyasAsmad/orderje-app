import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:orderje/constants/brand_color.dart';
import 'package:orderje/widgets/core/orderje_styles.dart';

class PaymentOrderItem extends StatelessWidget {
  PaymentOrderItem({super.key, required this.quantity, required this.itemName, required this.price});

  int quantity;
  String itemName;
  double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: OrderJeStyles.generateDecoration(
          circularBorder: true,
          borderRadius: 10,
          backgroundColor: OrderJeColors.red),
      height: 40,
      child: Row(
        children: [
          Text('${quantity}x', style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Text(itemName,
                  style: const TextStyle(fontWeight: FontWeight.w600))),
          Text('RM ${price.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
