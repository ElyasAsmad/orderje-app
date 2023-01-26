import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orderje/constants/brand_color.dart';
import 'package:orderje/widgets/orderje_button.dart';
import 'package:orderje/widgets/orderje_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        color: OrderJeColors.yellow,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: IconButton(
                        onPressed: () {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          }
                        },
                        icon: Icon(
                          CupertinoIcons.arrow_left,
                          color: OrderJeColors.black,
                        )),
                  ),
                  const Expanded(
                    child: Text(
                      'OrderJe',
                      style: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                    ),
                  ),
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
                child: LayoutBuilder(
                  builder: (BuildContext context,
                      BoxConstraints viewportConstraints) {
                    return SingleChildScrollView(
                      clipBehavior: Clip.none,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            minHeight: viewportConstraints.maxHeight),
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Log In',
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    OrderJeTextField(
                                      label: 'Email Address',
                                      keyboardType: TextInputType.emailAddress,
                                      prefixIcon:
                                          const Icon(CupertinoIcons.mail),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    OrderJeTextField(
                                      label: 'Password',
                                      obscureText: true,
                                      prefixIcon:
                                          const Icon(CupertinoIcons.lock),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    OrderJeButton(
                                      buttonText: 'Login',
                                      onPressed: () {
                                        // _formKey.currentState!.validate();
                                        Navigator.pushNamedAndRemoveUntil(
                                            context, '/home', (route) => false);
                                      },
                                      buttonColor: OrderJeColors.green,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
