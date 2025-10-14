import 'package:flutter/material.dart';
import 'package:hungry/features/checkout/widgets/order_summary.dart';
import 'package:hungry/features/checkout/widgets/payment_methods.dart';
import 'package:hungry/features/checkout/widgets/success_dailog.dart';
import 'package:hungry/features/shared/gaps.dart';
import 'package:hungry/features/shared/total_price_section.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CustomAppBar(),
              // GapH(20),
              OrderSummary(),
              GapH(20),
              PaymentMethods(),
              Spacer(),
              TotalPriceSection(
                text: 'Pay Now',
                onTap: () {
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) => const SuccessDialog(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
