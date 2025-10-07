import 'package:flutter/material.dart';
import 'package:hungry/features/product/widgets/selectable_extra_card.dart';
import 'package:hungry/features/shared/custom_text.dart';
import 'package:hungry/features/shared/gaps.dart';

class SideOptionsSection extends StatelessWidget {
  const SideOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: 'Side options', weight: FontWeight.w700, size: 20),
        GapH(10),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 15,
            children: [
              SelectableExtraCard(image: 'assets/sideOptions/Fries.png'),
              SelectableExtraCard(image: 'assets/sideOptions/Coleslaw.png'),
              SelectableExtraCard(image: 'assets/sideOptions/Salad.png'),
              SelectableExtraCard(image: 'assets/sideOptions/Onion.png'),
            ],
          ),
        ),
      ],
    );
  }
}
