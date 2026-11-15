import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/camera_session_cubit.dart';
import '../bloc/camera_session_state.dart';
import '../views/prepare_view.dart';

class CameraSessionPage extends StatelessWidget {
  const CameraSessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      body: BlocBuilder<CameraSessionCubit, CameraSessionState>(
        builder: (context, state) {
          return state.maybeWhen(
            initial: (prepareSeconds, controller) => PrepareView(
              prepareSeconds: prepareSeconds,
              controller: controller, // Controller kamera yang udah di-init di background!
              onStartPressed: () {
                // Panggil fungsi buat skip / langsung mulai sesi foto
                context.read<CameraSessionCubit>().skipAndStart();
              },
            ),
            orElse: () => const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
