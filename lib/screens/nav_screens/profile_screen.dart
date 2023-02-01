import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orderje/widgets/core/orderje_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OrderJeButton(
              buttonText: 'Log Out',
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              buttonColor: Colors.red,
            )
          ],
        )
    );
  }
}
