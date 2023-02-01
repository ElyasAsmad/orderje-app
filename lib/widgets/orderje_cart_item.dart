import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:orderje/constants/brand_color.dart';
import 'package:orderje/widgets/core/orderje_button.dart';
import 'package:orderje/widgets/core/orderje_outlined_button.dart';
import 'package:orderje/widgets/core/orderje_styles.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: OrderJeStyles.generateDecoration(
          borderRadius: 20, circularBorder: true),
      width: double.maxFinite,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Nasi Buttermilk Chicken',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text('RM 6.50')
              ],
            ),
          ),
          SizedBox(
            height: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    OrderJeOutlinedButton(
                      width: 35,
                      height: double.maxFinite,
                      onTap: () {},
                      backgroundColor: OrderJeColors.purple,
                      child: const Text(
                        '-',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: OrderJeColors.mainColor,
                      ),
                      width: 35,
                      height: double.maxFinite,
                      alignment: Alignment.center,
                      child: const Text('1',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                    ),
                    OrderJeOutlinedButton(
                      width: 35,
                      height: double.maxFinite,
                      onTap: () {},
                      backgroundColor: OrderJeColors.purple,
                      child: const Text(
                        '+',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                OutlinedButton(
                  onPressed: () {}, 
                  style: ButtonStyle(
                    side: MaterialStateBorderSide.resolveWith((states) => BorderSide(color: OrderJeColors.black)),
                    backgroundColor: MaterialStateColor.resolveWith((states) => OrderJeColors.red),
                  ),
                  child: Text('Remove', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: OrderJeColors.black),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
