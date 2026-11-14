import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(const PaymentState.initial());

  WebSocketChannel? _channel;
  Timer? _timer;
  int _remainingSeconds = 240;

  void startTimer(String idOrder) {
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

    // try {
    //   _channel = WebSocketChannel.connect(
    //     Uri.parse('wss://your-backend-api.com/ws/payment/$idOrder'),
    //   );

    //   _channel!.stream.listen((message) {
    //     final data = jsonDecode(message);

    //     if (data['status'] == 'settlement' ||
    //         data['status'] == 'paid' ||
    //         data['status'] == 'success') {
    //       _stopPaymentSession();
    //       emit(const PaymentState.success());
    //     }
    //   }, onError: (error) => emit(PaymentState.error(error.message)));
    // } catch (e) {
    //   _stopPaymentSession();
    //   emit(PaymentState.error(e.toString()));
    // }
  }

  void _stopPaymentSession() {
    _timer?.cancel();
    _channel?.sink.close();
    _channel = null;
  }

  @override
  Future<void> close() {
    _stopPaymentSession();
    return super.close();
  }
}
