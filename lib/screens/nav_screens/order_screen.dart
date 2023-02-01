import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orderje/constants/brand_color.dart';
import 'package:orderje/data/mock_mahallah_data.dart';
import 'package:orderje/widgets/core/orderje_styles.dart';
import 'package:orderje/widgets/core/orderje_iconbutton.dart';
import 'package:orderje/widgets/core/orderje_textfield.dart';
import 'package:orderje/widgets/mahallah_card/mahallah_card.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  
  late User? currentUser;

  @override
  void initState() {
    super.initState();

    currentUser = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Hi, ${currentUser?.displayName ?? "user"}', style: const TextStyle(fontSize: 16),),
                  const Text('Order Now!', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(child: OrderJeTextField(label: 'Search for any Mahallah', showLabel: false, color: OrderJeColors.mainColor, height: 50,)),
                      const SizedBox(width: 10,),
                      CircleButton(
                        icon: CupertinoIcons.location,
                        width: 60 ,
                        height: 60 ,
                        radius: 15,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Expanded(
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: OrderJeStyles.generateDecoration(),
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  clipBehavior: Clip.none,
                  physics: const AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics()),
                  child: ListView.separated(
                    physics:
                        const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    clipBehavior: Clip.none,
                    itemBuilder: (context, index) {
                      return MahallahCard(
                        mahallahCafeData: MahallahCafeData.mahallahCafeData[index],
                      );
                    },
                    separatorBuilder:
                        (context, index) =>
                            const SizedBox(
                              height: 10,
                            ),
                    itemCount: MahallahCafeData.mahallahCafeData.length)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}