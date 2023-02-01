import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orderje/constants/brand_color.dart';
import 'package:orderje/data/mock_promotion_data.dart';
import 'package:orderje/widgets/core/orderje_image.dart';

class FoodPromotionCard extends StatelessWidget {
  const FoodPromotionCard({super.key, required this.promotionData});

  final FoodPromotion promotionData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {},
      child: Container(
        width: 250,
        height: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: OrderJeColors.black)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: OrderJeColors.black))),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: OrderJeImage(
                  promotionData.url,
                  height: 169,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          promotionData.foodName,
                          style: const TextStyle(
                            fontSize: 16, 
                            fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          'RM${promotionData.foodPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 12, 
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF505050)
                          ),
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(CupertinoIcons.location_solid, size: 10,),
                        Text(
                          promotionData.location,
                          style: const TextStyle(
                            fontSize: 10
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
