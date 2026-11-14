import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_memoirs_codebase/features/frame_selection/data/frame_model_data.dart';

import 'frame_selection_state.dart';

class FrameCubit extends Cubit<FrameState> {
  FrameCubit() : super(const FrameState.initial());

  void selectFrame(FrameModel frame) {
    emit(FrameState.selectedFrame(selectedFrame: frame));
  }
}
