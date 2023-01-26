import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:orderje/constants/brand_color.dart';
import 'package:orderje/data/mock_promotion_data.dart';
import 'package:orderje/widgets/food_card/food_promotion_card.dart';
import 'package:orderje/widgets/orderje_foodcard.dart';
import 'package:orderje/widgets/orderje_iconbutton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late User? currentUser;

  @override
  void initState() {
    super.initState();

    currentUser = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        color: OrderJeColors.green,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'OrderJe',
                    style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),
                  CircleButton(
                    icon: CupertinoIcons.cart,
                    width: 50,
                    height: 50,
                    radius: 15,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: Container(
                  // padding: const EdgeInsets.all(25),
                  clipBehavior: Clip.hardEdge,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: OrderJeColors.mainColor,
                      border: Border.all(color: OrderJeColors.black),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0))),
                  child: LayoutBuilder(builder: (BuildContext context,
                      BoxConstraints viewportConstraints) {
                    return SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics()),
                        clipBehavior: Clip.none,
                        child: ConstrainedBox(
                            constraints: BoxConstraints(
                                minHeight: viewportConstraints.maxHeight),
                            child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        'Good morning, ${currentUser?.displayName ?? "user"}!',
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    const FoodCard(),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    const SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        'Food Promotions',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    SizedBox(
                                        width: double.infinity,
                                        height: 250,
                                        child: ListView.separated(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            shrinkWrap: true,
                                            clipBehavior: Clip.none,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return FoodPromotionCard(
                                                promotionData: PromotionData
                                                    .foodPromotionsData[index],
                                              );
                                            },
                                            separatorBuilder:
                                                (context, index) =>
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                            itemCount: PromotionData
                                                .foodPromotionsData.length))
                                  ],
                                ))));
                  })),
            )
          ],
        ),
      ),
    ));
  }
}

// ListView(
//   shrinkWrap: true,
//   clipBehavior: Clip.none,
//   scrollDirection: Axis.horizontal,
//   children: const [
//     FoodPromotionCard(),
//     FoodPromotionCard(),
//     FoodPromotionCard(),
//     FoodPromotionCard()
//   ],
// ),