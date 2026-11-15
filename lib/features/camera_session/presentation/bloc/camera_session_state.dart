import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:our_memoirs_codebase/features/frame_selection/data/frame_model_data.dart';

part 'camera_session_state.freezed.dart';

@freezed
class CameraSessionState with _$CameraSessionState {
  const factory CameraSessionState.initial({
    @Default(10) int prepareSeconds,
    CameraController? controller,
  }) = _Initial;
  const factory CameraSessionState.loading() = _Loading;
  const factory CameraSessionState.ready({
    required CameraController controller,
    required String cameraName,
    required FrameModel frameConfig,
    @Default(3) int slotCountdown,
    @Default(0) int currentSlotIndex,
    required int totalSlots,
    @Default([]) List<XFile?> capturedPhotos,
    @Default(false) bool isTakingPicture,
  }) = _Ready;
  const factory CameraSessionState.review({
    required CameraController controller,
    required FrameModel frameConfig,
    required List<XFile?> capturedPhotos,
    int? selectedIndexToRetake,
  }) = _Review;
  const factory CameraSessionState.error(String message) = _Error;
}
