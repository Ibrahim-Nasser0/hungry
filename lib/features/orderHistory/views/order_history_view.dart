import 'package:flutter/material.dart';
import 'package:hungry/features/orderHistory/widgets/order_history_card.dart';
import 'package:hungry/features/shared/custom_app_bar.dart';
import 'package:hungry/features/shared/gaps.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              CustomAppBar(),
              GapH(20),
              Expanded(
                child: ListView.separated(
                  itemCount: 5,
                  separatorBuilder: (context, index) => const GapH(10),
                  itemBuilder: (context, index) {
                    return OrderHistoryCard();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
