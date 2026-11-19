import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_state.freezed.dart';

@freezed
abstract class ResultState with _$ResultState {
  const factory ResultState.loading() = _Loading;
  const factory ResultState({
    required String imagePaths,
    @Default('download') String selectedAction,
    @Default(true) bool isQrMode,
    String? downloadUrl,
    String? shareUrl,
    @Default(120) int timerCountdown,
  }) = _ResultState;
  const factory ResultState.sendMail({required String email}) = _SendMail;
  const factory ResultState.error({required String message}) = _Error;
  const factory ResultState.success() = _Success;
}
