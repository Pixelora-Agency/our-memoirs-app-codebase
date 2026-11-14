import 'package:flutter_bloc/flutter_bloc.dart';

import 'review_order_state.dart';

class ReviewOrderCubit extends Cubit<ReviewOrderState> {
  ReviewOrderCubit() : super(const ReviewOrderState.initial());

  int pricePerItem = 0;
  int quantity = 1;

  int get totalPrice => quantity * pricePerItem;

  Future<void> fetchOrderData() async {
    emit(const ReviewOrderState.loading());

    await Future.delayed(const Duration(seconds: 1));

    pricePerItem = 36000;

    emit(const ReviewOrderState.initial());
  }

  void incrementQuantity() {
    quantity++;
    emit(ReviewOrderState.loaded(quantity: quantity, totalPrice: totalPrice));
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
      emit(ReviewOrderState.loaded(quantity: quantity, totalPrice: totalPrice));
    }
  }

  Future<void> submitPayment(String? voucherCode) async {
    emit(const ReviewOrderState.loading());

    await Future.delayed(const Duration(seconds: 3));

    if (voucherCode != null && voucherCode.trim().isNotEmpty) {
      final cleanCode = voucherCode.trim().toUpperCase();

      if (cleanCode == "PROMO123" || cleanCode == "DISKON50") {
        const simulatedQrPayload =
            "https://api.qris.id/demo/qr-payload-promo-success";
        const idOrder = "OM-P0001";
        emit(
          const ReviewOrderState.success(
            qrCodeData: simulatedQrPayload,
            idOrder: idOrder,
          ),
        );
        return;
      } else {
        emit(
          ReviewOrderState.loaded(quantity: quantity, totalPrice: totalPrice),
        );
        emit(
          ReviewOrderState.error(
            "Kode voucher '$voucherCode' tidak valid atau sudah kadaluarsa!",
          ),
        );
        return;
      }
    }

    const simulatedQrPayload =
        "https://api.qris.id/demo/qr-payload-normal-12345";
    const idOrder = "OM-P0001";
    emit(
      const ReviewOrderState.success(
        qrCodeData: simulatedQrPayload,
        idOrder: idOrder,
      ),
    );
  }

  void resetState() {
    emit(ReviewOrderState.loaded(quantity: quantity, totalPrice: totalPrice));
  }
}
