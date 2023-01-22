import 'package:flutter/material.dart';
import 'package:orderje/constants/brand_color.dart';
import 'package:orderje/constants/orderje_theme.dart';

class OrderJeButton extends StatefulWidget {
  OrderJeButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.buttonColor = const Color(0xFFFFFAF0)});

  Color buttonColor = OrderJeColors.mainColor;
  String buttonText;
  VoidCallback onPressed;

  @override
  State<OrderJeButton> createState() => _OrderJeButtonState();
}

class _OrderJeButtonState extends State<OrderJeButton> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    double offset = pressed ? 0 : OrderJeTheme.shadowOffset;

    return SizedBox(
        width: double.infinity,
        height: 60.0,
        child: Stack(clipBehavior: Clip.none, children: [
          AnimatedPositioned(
            bottom: offset,
            right: offset,
            top: -offset,
            left: -offset,
            duration: OrderJeTheme.buttonDuration,
            curve: Curves.bounceInOut,
            child: InkWell(
              onTap: widget.onPressed,
              onTapDown: (_) => setState(() {
                pressed = true;
              }),
              onTapUp: (_) => setState(() {
                pressed = false;
              }),
              onTapCancel: () => setState(() {
                pressed = false;
              }),
              child: AnimatedContainer(
                duration: OrderJeTheme.buttonDuration,
                curve: Curves.bounceInOut,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: widget.buttonColor,
                    border: Border.all(color: const Color(0xFF1E1E1E)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(offset, offset),
                          color: const Color(0xFF1E1E1E))
                    ],
                    borderRadius: BorderRadius.circular(15.0)),
                child: Text(
                  widget.buttonText,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ]));
  }
}
