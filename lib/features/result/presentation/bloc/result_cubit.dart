import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'result_state.dart';

class ResultCubit extends Cubit<ResultState> {
  String? currentUrl;
  String? token;
  Timer? timer;

  ResultCubit() : super(const ResultState(imagePaths: ''));

  Future<void> initialRender(String imagePaths, bool isLandscape) async {
    emit(const ResultState.loading());

    try {
      final prefs = await SharedPreferences.getInstance();
      // token = prefs.getString('verify_token') ?? '';

      final uploadedUrl = await uploadImageToStorage(imagePaths);
      final downloadUrl = await downloadImageUrl(uploadedUrl);
      final sendUrl = await sendImageUrl();

      emit(
        ResultState(
          imagePaths: imagePaths,
          selectedAction: 'download',
          isQrMode: true,
          downloadUrl: downloadUrl,
          shareUrl: sendUrl,
          timerCountdown: 120,
          isLandscape: isLandscape,
        ),
      );

      startCoundown();
    } catch (e) {
      debugPrint("Error is :$e");
    }
  }

  void startCoundown() {
    int second = 120;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (second == 0) {
        timer.cancel();
        return;
      }
      second--;
      state.maybeMap(
        (value) => emit(value.copyWith(timerCountdown: second)),
        orElse: () {},
      );
    });
  }

  Future<String> uploadImageToStorage(String imagePath) async {
    final file = File(imagePath);
    if (!await file.exists()) {
      throw Exception('File gambar tidak ditemukan: $imagePath');
    }

    return 'https://ourmemoirs.com/photos/hasil.jpg';
  }

  Future<String> downloadImageUrl(String uploadedUrl) async {
    if (uploadedUrl.isEmpty) return '';

    return 'https://ourmemoirs.com/photos/$uploadedUrl';
  }

  Future<String> sendImageUrl() async {
    return 'https://ourmemoirs.com/result/$token';
  }

  void changeAction(String action) {
    state.maybeMap(
      (value) => emit(value.copyWith(selectedAction: action)),
      orElse: () {},
    );
  }

  void toggleAction(int index) {
    bool action = index == 0 ? true : false;
    state.maybeMap(
      (value) => emit(value.copyWith(isQrMode: action)),
      orElse: () {},
    );
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}
