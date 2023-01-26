import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:orderje/constants/brand_color.dart';
import 'package:orderje/constants/orderje_theme.dart';

class CircleButton extends StatefulWidget {
  CircleButton(
      {super.key,
      this.onPressed,
      required this.icon,
      this.color = const Color(0xFFCFADE8),
      this.height = 60,
      this.width = 60,
      this.radius = 30
    });

  VoidCallback? onPressed;
  IconData icon;
  Color color;
  double width, height, radius;

  @override
  State<CircleButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    double offset = pressed ? 0 : OrderJeTheme.shadowOffset;

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(clipBehavior: Clip.none, children: [
        AnimatedPositioned(
          bottom: offset,
          right: offset,
          top: -offset,
          left: -offset,
          duration: OrderJeTheme.buttonDuration,
          child: AnimatedContainer(
            duration: OrderJeTheme.buttonDuration,
            decoration: BoxDecoration(
                color: OrderJeColors.purple,
                border: Border.all(color: OrderJeColors.black),
                borderRadius: BorderRadius.circular(widget.radius),
                boxShadow: [
                  BoxShadow(
                      color: OrderJeColors.black,
                      offset: Offset(offset, offset))
                ]),
            child: InkWell(
              borderRadius: BorderRadius.circular(widget.radius),
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
              child: Container(
                alignment: Alignment.center,
                child: FaIcon(
                  widget.icon,
                  color: OrderJeColors.black,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
