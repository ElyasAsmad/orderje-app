import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:orderje/constants/brand_color.dart';
import 'package:orderje/widgets/core/orderje_styles.dart';
import 'package:orderje/widgets/payment_overview_card/payment_order_item.dart';

class PaymentOverviewCard extends StatelessWidget {
  PaymentOverviewCard({super.key, required this.title, this.height = 220});

  String title;
  double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: height,
      decoration: OrderJeStyles.generateDecoration(
        circularBorder: true,
        borderRadius: 20,
      ),
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: OrderJeColors.black))),
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
          Expanded(
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.all(10.0),
              child: ListView.separated(
                  clipBehavior: Clip.none,
                  physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return PaymentOrderItem(
                      quantity: 1,
                      itemName: 'Nasi Butter Chicken',
                      price: 6.00,
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 5,
                      ),
                  itemCount: 3),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(top: BorderSide(color: OrderJeColors.black))),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Quantity'),
                      Text('2', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Total Price'),
                      Text('RM 20.00', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
