import 'package:flutter/material.dart';
import 'package:hungry/features/product/presentation/views/widgets/selectable_extra_card.dart';
import 'package:hungry/core/shared/widgets/custom_text.dart';
import 'package:hungry/core/shared/widgets/gaps.dart';

class ToppingsSection extends StatelessWidget {
  const ToppingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: 'Toppings', weight: FontWeight.w700, size: 20),
        GapH(10),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 15,
            children: [
              SelectableExtraCard(image: 'assets/toppings/Tomato.png'),
              SelectableExtraCard(image: 'assets/toppings/Onions.png'),
              SelectableExtraCard(image: 'assets/toppings/Pickles.png'),
              SelectableExtraCard(image: 'assets/toppings/Bacons.png'),
            ],
          ),
        ),
      ],
    );
  }
}
