import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:our_memoirs_codebase/features/frame_selection/models/frame_models.dart';

part 'frame_selection_state.freezed.dart';

@freezed
class FrameState with _$FrameState {
  const factory FrameState.initial() = _Initial;
  const factory FrameState.selectedFrame({required FrameModel selectedFrame}) =
      _SelectedFrame;
}
