import 'package:flutter/material.dart';

import '../../constants/brand_color.dart';

class OrderJeStyles {

  static BoxDecoration generateDecoration({Color? backgroundColor, double borderRadius = 40, bool circularBorder = false}) {

    return BoxDecoration(
      color: backgroundColor ?? OrderJeColors.mainColor,
      border: Border.all(color: OrderJeColors.black),
      borderRadius: !circularBorder ? BorderRadius.only(
          topLeft: Radius.circular(borderRadius), topRight: Radius.circular(borderRadius)) : BorderRadius.circular(borderRadius));
  }
}
