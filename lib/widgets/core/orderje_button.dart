import 'package:flutter/material.dart';
import 'package:orderje/constants/brand_color.dart';
import 'package:orderje/constants/orderje_theme.dart';

class OrderJeButton extends StatefulWidget {
  OrderJeButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.buttonColor = const Color(0xFFFFFAF0),
      this.height = 60,
      this.buttonTextStyle = const TextStyle(
          color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w600),
      this.borderRadius = 15,
      this.hideShadow = false,
      this.width});

  Color? buttonColor = OrderJeColors.mainColor;
  String buttonText;
  VoidCallback onPressed;
  double height;
  double? width;
  TextStyle buttonTextStyle;
  double borderRadius;
  bool hideShadow;

  @override
  State<OrderJeButton> createState() => _OrderJeButtonState();
}

class _OrderJeButtonState extends State<OrderJeButton> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    double offset = pressed ? 0 : OrderJeTheme.shadowOffset;

    return SizedBox(
        width: widget.width ?? double.infinity,
        height: widget.height,
        child: Stack(clipBehavior: Clip.none, children: [
          AnimatedPositioned(
            bottom: offset,
            right: offset,
            top: -offset,
            left: -offset,
            duration: OrderJeTheme.buttonDuration,
            curve: Curves.bounceInOut,
            child: GestureDetector(
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
                    color: widget.buttonColor ?? OrderJeColors.mainColor,
                    border: Border.all(color: const Color(0xFF1E1E1E)),
                    boxShadow: !widget.hideShadow
                        ? [
                            BoxShadow(
                                offset: Offset(offset, offset),
                                color: const Color(0xFF1E1E1E))
                          ]
                        : null,
                    borderRadius: BorderRadius.circular(widget.borderRadius)),
                child: Text(
                  widget.buttonText,
                  style: widget.buttonTextStyle,
                ),
              ),
            ),
          ),
        ]));
  }
}
