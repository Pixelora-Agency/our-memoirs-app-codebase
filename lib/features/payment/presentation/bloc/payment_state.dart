import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_state.freezed.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState.initial({@Default(240) int remainingSeconds}) =
      _Initial;
  const factory PaymentState.loading() = _Loading;

  const factory PaymentState.countdown({required int remainingSeconds}) =
      _Countdown;

  const factory PaymentState.success() = _Success;
  const factory PaymentState.expired() = _Expired;
  const factory PaymentState.error(String message) = _Error;
}
