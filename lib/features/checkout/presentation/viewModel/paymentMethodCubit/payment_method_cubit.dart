import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'payment_method_state.dart';

class PaymentMethodCubit extends Cubit<PaymentMethodState> {
  PaymentMethodCubit() : super(PaymentMethodInitial(payaymentMethod: 1));
  void cashOnDelivery() {
    if (state.payaymentMethod != 1) {
      emit(ToggleMethod(payaymentMethod: 1));
    }
  }

  void payWithCard() {
    if (state.payaymentMethod != 2) {
      emit(ToggleMethod(payaymentMethod: 2));
    }
  }
}
