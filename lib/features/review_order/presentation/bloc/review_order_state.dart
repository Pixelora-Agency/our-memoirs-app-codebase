import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_order_state.freezed.dart';

@freezed
class ReviewOrderState with _$ReviewOrderState {
  const factory ReviewOrderState.initial() = _Initial;
  const factory ReviewOrderState.loading() = _Loading;
  const factory ReviewOrderState.loaded({
    required int quantity,
    required int totalPrice,
  }) = _Loaded;
  const factory ReviewOrderState.success({
    required String qrCodeData,
    required String idOrder,
  }) = _Success;
  const factory ReviewOrderState.error(String message) = _Error;
}
