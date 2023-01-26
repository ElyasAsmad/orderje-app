import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:orderje/constants/brand_color.dart';
import 'package:orderje/screens/auth/login_screen.dart';
import 'package:orderje/screens/auth/signup_screen.dart';
import 'package:orderje/widgets/orderje_button.dart';
import 'package:orderje/widgets/orderje_iconbutton.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

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
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Let\'s Get Started!',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
                  ),
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
                ),
                const SizedBox(height: 20,),
                const Text('or continue with', style: TextStyle(fontSize: 12),textAlign: TextAlign.center,),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleButton(
                      icon: FontAwesomeIcons.google,
                      onPressed: signInWithGoogle,
                    ),
                    const SizedBox(width: 10,),
                    CircleButton(
                      icon: FontAwesomeIcons.microsoft,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
