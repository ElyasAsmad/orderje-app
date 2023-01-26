import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:orderje/constants/brand_color.dart';
import 'package:orderje/widgets/orderje_iconbutton.dart';
import 'package:orderje/widgets/orderje_textfield.dart';

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
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
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
                  icon: CupertinoIcons.cart,
                  width: 60 ,
                  height: 60 ,
                  radius: 15,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}