import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _pad = 2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTapDown: (_) => setState(() {
              _pad = 0;
            }),
            onTapUp: (_) => setState(() {
              _pad = 2;
            }),
            child: AnimatedContainer(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: const Color(0xFF1E1E1E),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 0,
                        offset: Offset(_pad, _pad),
                        color: const Color(0xFF1E1E1E))
                  ],
                  border: Border.all(width: 0.5)),
              duration: const Duration(milliseconds: 250),
              curve: Curves.ease,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: const Color(0xFF00C2CB)),
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 24.0),
                child: const Text('Hello World'),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
