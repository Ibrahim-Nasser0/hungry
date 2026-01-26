part of 'payment_method_cubit.dart';

@immutable
sealed class PaymentMethodState {
  final int payaymentMethod;

  const PaymentMethodState({required this.payaymentMethod});
}

final class PaymentMethodInitial extends PaymentMethodState {
  const PaymentMethodInitial({required super.payaymentMethod});
}

final class ToggleMethod extends PaymentMethodState {
  const ToggleMethod({required super.payaymentMethod});
}
