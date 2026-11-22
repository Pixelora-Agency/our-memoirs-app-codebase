import 'package:flutter_bloc/flutter_bloc.dart';

import 'review_order_state.dart';

class ReviewOrderCubit extends Cubit<ReviewOrderState> {
  ReviewOrderCubit() : super(const ReviewOrderState.initial());

  int pricePerItem = 36000;
  int quantity = 1;

  // --- VOUCHER ---
  String voucherCode = '';
  int discountPercent = 0;

  // kode -> persen diskon (sesuaikan angkanya)
  static const Map<String, int> _vouchers = {'PROMO123': 10, 'DISKON50': 50};

  int get subtotal => quantity * pricePerItem;
  int get discount => subtotal * discountPercent ~/ 100;
  int get totalPrice => subtotal - discount;

  void _emitLoaded() {
    emit(
      ReviewOrderState.loaded(
        quantity: quantity,
        totalPrice: totalPrice,
        discount: discount,
      ),
    );
  }

  Future<void> fetchOrderData() async {
    emit(const ReviewOrderState.loading());

    await Future.delayed(const Duration(seconds: 1));

    emit(const ReviewOrderState.initial(quantity: 1, totalPrice: 36000));
  }

  /// Dipanggil tiap user mengetik di field voucher
  void onVoucherChanged(String input) {
    voucherCode = input.trim().toUpperCase();
    discountPercent = _vouchers[voucherCode] ?? 0;
    _emitLoaded();
  }

  void incrementQuantity() {
    quantity++;
    _emitLoaded();
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
      _emitLoaded();
    }
  }

  Future<void> submitPayment() async {
    // Kode diisi tapi tidak cocok dengan daftar voucher
    if (voucherCode.isNotEmpty && discountPercent == 0) {
      emit(
        ReviewOrderState.error(
          "Kode voucher '$voucherCode' tidak valid atau sudah kadaluarsa!",
        ),
      );
      _emitLoaded();
      return;
    }

    emit(const ReviewOrderState.loading());

    await Future.delayed(const Duration(seconds: 3));

    // totalPrice sudah final (sudah dipotong diskon), tinggal dipakai
    final qrPayload = discountPercent > 0
        ? "https://api.qris.id/demo/qr-payload-promo-success"
        : "https://api.qris.id/demo/qr-payload-normal-12345";

    emit(ReviewOrderState.success(qrCodeData: qrPayload, idOrder: "OM-P0001"));
  }

  void resetState() {
    _emitLoaded();
  }
}
