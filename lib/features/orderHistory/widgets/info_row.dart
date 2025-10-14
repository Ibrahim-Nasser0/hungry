import 'package:flutter/material.dart';
import 'package:hungry/features/shared/custom_text.dart';
import 'package:hungry/features/shared/gaps.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(text: '$label:', weight: FontWeight.w700, size: 16),
        GapW(5),
        CustomText(text: value, weight: FontWeight.w700, size: 16),
      ],
    );
  }
}
