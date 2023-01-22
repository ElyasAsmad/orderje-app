import 'package:flutter/material.dart';
import 'package:orderje/constants/brand_color.dart';
import 'package:orderje/screens/auth/login_screen.dart';
import 'package:orderje/screens/auth/signup_screen.dart';
import 'package:orderje/widgets/orderje_button.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OrderJeColors.yellow,
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'OrderJe',
                    style:
                        TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Food at the speed of a click.',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(25.0),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF1E1E1E)),
                color: OrderJeColors.mainColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                )),
            height: 350,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Let\'s Get Started!',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                OrderJeButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/auth/register');
                  },
                  buttonText: 'Create an account',
                  buttonColor: const Color(0xFFABE5BC),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                OrderJeButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/auth/login');
                  },
                  buttonText: 'Log in to your account',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
