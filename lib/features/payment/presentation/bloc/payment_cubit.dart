import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(const PaymentState.initial());

  Timer? _timer;
  int _remainingSeconds = 240;

  void startTimer() {
    _timer?.cancel();
    emit(PaymentState.countdown(remainingSeconds: _remainingSeconds));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        emit(PaymentState.countdown(remainingSeconds: _remainingSeconds));
      } else {
        timer.cancel();
        emit(const PaymentState.expired());
      }
    });
  }

  Future<void> checkOrSimulatePaymentSuccess() async {
    _timer?.cancel();

    emit(const PaymentState.loading());

    await Future.delayed(const Duration(seconds: 150));
    emit(const PaymentState.success());
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
