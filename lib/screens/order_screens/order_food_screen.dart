import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:orderje/constants/brand_color.dart';
import 'package:orderje/controllers/order_food_controller.dart';
import 'package:orderje/data/mock_food_data.dart';
import 'package:orderje/data/mock_mahallah_data.dart';
import 'package:orderje/widgets/core/orderje_button.dart';
import 'package:orderje/widgets/core/orderje_styles.dart';
import 'package:orderje/widgets/orderje_cart_item.dart';
import 'package:orderje/widgets/orderje_order_food_card.dart';
import 'package:orderje/widgets/utils/child_size_notifier.dart';

class OrderFoodScreen extends StatelessWidget {
  OrderFoodScreen({super.key});

  final OrderFoodController c = Get.put(OrderFoodController());

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MahallahCafe;

    return Scaffold(
      backgroundColor: OrderJeColors.green,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            children: [
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
                    Text(
                      args.mahallahName,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ChildSizeNotifier(
                builder: (context, size, child) {
                  return GetX<OrderFoodController>(builder: (controller) {
                    return Expanded(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                        decoration: OrderJeStyles.generateDecoration(
                            backgroundColor: OrderJeColors.yellow),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 45,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: OrderJeButton(
                                    buttonText: 'Foods',
                                    onPressed: () {
                                      controller.setIndex(0);
                                    },
                                    buttonColor: controller.tabIndex.value == 0
                                        ? OrderJeColors.purple
                                        : null,
                                    hideShadow: true,
                                    borderRadius: 30,
                                    buttonTextStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: OrderJeButton(
                                    buttonText: 'Drinks',
                                    onPressed: () {
                                      controller.setIndex(1);
                                    },
                                    buttonColor: controller.tabIndex.value == 1
                                        ? OrderJeColors.purple
                                        : null,
                                    hideShadow: true,
                                    borderRadius: 30,
                                    buttonTextStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  )),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                padding: const EdgeInsets.all(10),
                                width: double.maxFinite,
                                decoration: OrderJeStyles.generateDecoration(
                                    borderRadius: 30, circularBorder: true),
                                child: ListView.separated(
                                    physics:
                                        const AlwaysScrollableScrollPhysics(
                                            parent: BouncingScrollPhysics()),
                                    clipBehavior: Clip.none,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return OrderFoodCard(
                                        foodData: CafeFoodData.foodData[index],
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                          height: 10,
                                        ),
                                    itemCount: CafeFoodData.foodData.length),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                              decoration: OrderJeStyles.generateDecoration(
                                  circularBorder: true, borderRadius: 30),
                              height: controller.isShowCart.value
                                  ? size.height * 0.8
                                  : 135,
                              width: double.maxFinite,
                              child: Column(
                                children: [
                                  Expanded(
                                      child: Visibility(
                                    visible: controller.isShowCart.value,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          'My Cart',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Expanded(
                                          child: ListView.separated(
                                              clipBehavior: Clip.hardEdge,
                                              shrinkWrap: true,
                                              physics:
                                                  const AlwaysScrollableScrollPhysics(
                                                      parent:
                                                          BouncingScrollPhysics()),
                                              itemBuilder: (context, index) {
                                                return const CartItem();
                                              },
                                              separatorBuilder:
                                                  (context, index) =>
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                              itemCount: 3),
                                        )
                                      ],
                                    ),
                                  )),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                'Total Items',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                              Text('2F 2D',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: const [
                                              Text(
                                                'Subtotal',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                              Text('RM20.00',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 45,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: OrderJeButton(
                                          buttonText: c.isShowCart.value
                                              ? 'Close Cart'
                                              : 'View My Cart',
                                          onPressed: () {
                                            controller.toggle();
                                          },
                                          buttonColor: c.isShowCart.value
                                              ? OrderJeColors.red
                                              : null,
                                          hideShadow: true,
                                          borderRadius: 30,
                                          buttonTextStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        )),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            child: OrderJeButton(
                                          buttonText: 'Checkout',
                                          buttonColor: OrderJeColors.purple,
                                          onPressed: () {
                                            Get.toNamed('/payment');
                                          },
                                          hideShadow: true,
                                          borderRadius: 30,
                                          buttonTextStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
