import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_setting_state.freezed.dart';

@freezed
abstract class DeviceSettingState with _$DeviceSettingState {
  const factory DeviceSettingState({
    @Default([]) List<CameraDescription> cameras,
    CameraDescription? selectedCamera,
    @Default(false) bool isCameraReady,
    @Default(false) bool isInitializingCamera,
    String? selectedPrinter,
    String? errorMessage,
  }) = _DeviceSettingState;
}
