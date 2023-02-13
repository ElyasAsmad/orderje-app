import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:orderje/constants/orderje_theme.dart';
import 'package:orderje/widgets/core/orderje_styles.dart';

class OrderJeOutlinedButton extends StatelessWidget {
  OrderJeOutlinedButton(
      {super.key,
      this.onTap,
      this.height,
      this.width,
      this.backgroundColor,
      this.borderRadius = 10,
      required this.child});

  VoidCallback? onTap;
  Widget child;
  double? width;
  double? height;
  Color? backgroundColor;
  double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: OrderJeTheme.buttonDuration,
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: OrderJeStyles.generateDecoration(
          backgroundColor: backgroundColor,
          borderRadius: borderRadius,
          circularBorder: true,
        ),
        child: child,
      ),
    );
  }
}
