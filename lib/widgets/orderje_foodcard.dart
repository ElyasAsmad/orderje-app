import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:orderje/constants/brand_color.dart';
import 'package:orderje/constants/orderje_theme.dart';
import 'package:orderje/widgets/food_card/order_status.dart';

class FoodCard extends StatefulWidget {
  const FoodCard({super.key});

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: OrderJeColors.mainColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: OrderJeColors.black
        ),
        boxShadow: [
          BoxShadow(
            color: OrderJeColors.black,
            offset: Offset(OrderJeTheme.shadowOffset, OrderJeTheme.shadowOffset)
          )
        ]
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OrderStatus(color: OrderJeColors.yellow, title: 'Food Preparing', description: 'We are preparing your food'),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Order',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF505050),
                      fontSize: 10
                    ),
                  ),
                  Text(
                    '#12',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: OrderJeColors.black,
                        fontSize: 18
                      )
                  )
                ],
              )
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        const Text(
                          '1x',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Buttermilk Chicken Rice',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                              ),  
                            ),
                            Text(
                              'DidiFamily Enterprise',
                               style: TextStyle(
                                fontSize: 10
                              ),  
                            ),
                          ],
                        )
                      ],
                    ),
                    const Text(
                      'Mahallah Ali',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    )
                  ],
                )
              ],
            )
          ),
          const SizedBox(height: 5,),
          // This container to give border colour
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              border: Border.all(
                color: OrderJeColors.black
              ),
              borderRadius: BorderRadius.circular(10)
            ),
            // Second container to clip the border!
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              child: LinearProgressIndicator(
                backgroundColor: OrderJeColors.mainColor,
                minHeight: 5,
              ),
            ),
          )
        ],
      ),
    );
  }
}