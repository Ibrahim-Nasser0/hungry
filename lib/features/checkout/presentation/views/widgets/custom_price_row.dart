import 'package:flutter/material.dart';
import 'package:hungry/core/shared/widgets/custom_text.dart';

class CustomPriceRow extends StatelessWidget {
  const CustomPriceRow({
    super.key,
    required this.text,
    required this.price,
    this.weight = FontWeight.w400,
  });
  final String text;
  final double price;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(text: text, weight: weight, size: 18),
        Spacer(),
        CustomText(text: '\$ $price', weight: weight, size: 18),
      ],
    );
  }
}
