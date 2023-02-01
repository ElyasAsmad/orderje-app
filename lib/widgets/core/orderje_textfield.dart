import 'package:flutter/material.dart';
import 'package:orderje/constants/brand_color.dart';
import 'package:orderje/constants/orderje_theme.dart';
import 'package:orderje/widgets/orderje_inputborder.dart';

class OrderJeTextField extends StatefulWidget {
  OrderJeTextField(
      {Key? key,
      required this.label,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.prefixIcon,
      this.validator,
      this.showLabel = true,
      this.color,
      this.height})
      : super(key: key);

  final String? Function(String? value)? validator;
  final Widget? prefixIcon;
  final TextInputType keyboardType;
  final String label;
  final bool obscureText, showLabel;
  Color? color;
  double? height;

  @override
  State<OrderJeTextField> createState() => _OrderJeTextFieldState();
}

class _OrderJeTextFieldState extends State<OrderJeTextField> {
  final OrderJeInputBorder _orderJeInputBorder = OrderJeInputBorder(
      child: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      shadow: BoxShadow(
          color: OrderJeColors.black,
          offset:
              Offset(OrderJeTheme.shadowOffset, OrderJeTheme.shadowOffset)));

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: widget.color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.showLabel
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.label,
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                  ],
                )
              : const SizedBox.shrink(),
          TextFormField(
            keyboardType: widget.keyboardType,
            obscureText: widget.obscureText,
            validator: widget.validator,
            decoration: InputDecoration(
                hintText: widget.label,
                prefixIcon: widget.prefixIcon,
                hintStyle: const TextStyle(
                    color: Color(0xFF707070), fontWeight: FontWeight.normal),
                enabledBorder: _orderJeInputBorder,
                border: _orderJeInputBorder,
                floatingLabelBehavior: FloatingLabelBehavior.never),
          )
        ],
      ),
    );
  }
}
