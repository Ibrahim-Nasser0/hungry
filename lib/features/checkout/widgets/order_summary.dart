import 'package:flutter/material.dart';
import 'package:hungry/features/checkout/widgets/custom_price_row.dart';
import 'package:hungry/features/shared/custom_text.dart';
import 'package:hungry/features/shared/gaps.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: 'Order summary', weight: FontWeight.w600, size: 20),
        GapH(10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPriceRow(text: 'Order', price: 20),
              GapH(5),
              CustomPriceRow(text: 'Texes', price: 20),
              GapH(5),
              CustomPriceRow(text: 'Delivery fees', price: 20),
              GapH(10),
              Divider(height: 1),
              GapH(20),
              CustomPriceRow(text: "Total", price: 60, weight: FontWeight.w600),
              GapH(5),
              Row(
                children: [
                  CustomText(
                    text: 'Estimated delivery time:',
                    weight: FontWeight.w600,
                    size: 14,
                  ),
                  Spacer(),
                  CustomText(
                    text: '15 - 30 mins',
                    weight: FontWeight.w600,
                    size: 14,
                  ),
                ],
              ),
              GapH(20),
              Divider(height: 1),
            ],
          ),
        ),
      ],
    );
  }
}
