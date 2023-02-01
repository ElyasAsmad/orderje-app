import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:orderje/widgets/core/orderje_styles.dart';

class OrderJeOutlinedButton extends StatelessWidget {
  OrderJeOutlinedButton({super.key, this.onTap, this.height, this.width, this.backgroundColor, required this.child});

  VoidCallback? onTap;
  Widget child;
  double? width;
  double? height;
  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: OrderJeStyles.generateDecoration(
          backgroundColor: backgroundColor,
          borderRadius: 10,
          circularBorder: true,
        ),
        child: child,
      ),
    );
  }
}
