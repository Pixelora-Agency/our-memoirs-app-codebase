import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:our_memoirs_codebase/features/frame_selection/models/frame_models.dart';

part 'camera_session_state.freezed.dart';

@freezed
class CameraSessionState with _$CameraSessionState {
  const factory CameraSessionState.initial({
    @Default(10) int prepareSeconds,
    String? frameName,
    CameraController? controller,
  }) = _Initial;
  const factory CameraSessionState.loading() = _Loading;
  const factory CameraSessionState.ready({
    required CameraController controller,
    required String cameraName,
    required FrameModel frameConfig,
    @Default(10) int slotCountdown,
    @Default(0) int currentSlotIndex,
    required int totalSlots,
    @Default([]) List<XFile?> capturedPhotos,
    @Default(false) bool isTakingPicture,
    @Default(0) int chanceRetake,
  }) = _Ready;
  const factory CameraSessionState.print({
    required FrameModel frameConfig,
    required List<XFile?> capturedPhotos,
    @Default(false) bool mirrorImg,
  }) = _Print;
  const factory CameraSessionState.error(String message) = _Error;
}
