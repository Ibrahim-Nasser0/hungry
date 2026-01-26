import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/checkout/presentation/viewModel/paymentMethodCubit/payment_method_cubit.dart';
import 'package:hungry/features/checkout/presentation/views/widgets/order_summary.dart';
import 'package:hungry/features/checkout/presentation/views/widgets/payment_methods.dart';
import 'package:hungry/features/checkout/presentation/views/widgets/success_dailog.dart';
import 'package:hungry/core/shared/widgets/gaps.dart';
import 'package:hungry/core/shared/widgets/total_price_section.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentMethodCubit(),
      child: Scaffold(
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
      ),
    );
  }
}
