import 'package:flutter/material.dart';
import 'package:orderje/constants/brand_color.dart';
import 'package:orderje/data/mock_food_data.dart';
import 'package:orderje/widgets/core/orderje_button.dart';
import 'package:orderje/widgets/core/orderje_image.dart';
import 'package:orderje/widgets/core/orderje_styles.dart';

class OrderFoodCard extends StatelessWidget {
  OrderFoodCard({super.key, required this.foodData});

  CafeFood foodData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.maxFinite,
      decoration: OrderJeStyles.generateDecoration(
          borderRadius: 20, circularBorder: true),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
            width: 110,
            height: double.maxFinite,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              child: OrderJeImage(
                foodData.imageUrl,
                height: 120,
                width: 105,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              decoration: BoxDecoration(
                  border: Border(left: BorderSide(color: OrderJeColors.black))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        foodData.foodName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            height: 1.25),
                      ),
                      Text('RM ${foodData.price.toStringAsFixed(2)}'),
                    ],
                  ),
                  OutlinedButton(
                    onPressed: () {}, 
                    style: ButtonStyle(
                      side: MaterialStateBorderSide.resolveWith((states) => BorderSide(color: OrderJeColors.black)),
                      backgroundColor: MaterialStateColor.resolveWith((states) => OrderJeColors.green),
                    ),
                    child: Text('Add to Cart', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: OrderJeColors.black),),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
