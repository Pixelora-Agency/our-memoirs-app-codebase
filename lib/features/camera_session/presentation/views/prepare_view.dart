import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:our_memoirs_codebase/core/constants/app_typo.dart';
import 'package:our_memoirs_codebase/core/utils/format_time.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_button.dart';

class PrepareView extends StatelessWidget {
  final int prepareSeconds;
  final CameraController? controller;
  final VoidCallback onStartPressed;
  final String frameName;

  const PrepareView({
    super.key,
    required this.prepareSeconds,
    required this.frameName,
    required this.controller,
    required this.onStartPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    DateTime now = DateTime.now();

    String hour = now.hour.toString().padLeft(2, '0');
    String minutes = now.minute.toString().padLeft(2, '0');

    String formattedDateNow = DateFormat('dd MMMM yyyy', 'en_US').format(now);
    String formattedTimeNow = '$hour:$minutes';

    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(child: Container(color: Colors.black)),
        if (controller != null && controller!.value.isInitialized)
          Center(
            child: FractionallySizedBox(
              widthFactor: 0.9, // Mengambil 70% dari lebar layar
              heightFactor: 1, // Mengambil 70% dari tinggi layar
              child: ClipRRect(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: controller!.value.aspectRatio,
                    height: 1.0,
                    child: CameraPreview(controller!),
                  ),
                ),
              ),
            ),
          )
        else
          Container(
            color: Colors.black,
          ), // Fallback hitam jika kamera masih loading
        Container(color: Colors.black.withValues(alpha: 0.7)),

        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 80.0,
              vertical: 32.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Atas (Logo & Info Sesi)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.translate(
                      offset: const Offset(0, -16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Our", style: AppTypography.titlePage),
                          Transform.translate(
                            offset: const Offset(5, 9),
                            child: Text(
                              "Memoirs",
                              style: AppTypography.titleScriptPage,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(formattedDateNow, style: AppTypography.heading3),
                        Text(
                          "$formattedTimeNow | Take 1\n$frameName",

                          style: AppTypography.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),

                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Get Ready!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: AppTypography.size4xl,
                            fontWeight: AppTypography.weightBold,
                            letterSpacing: AppTypography.trackingMedium,
                            height: AppTypography.leadingTight,
                          ),
                        ),
                        const Text(
                          "Your session will start in",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: AppTypography.sizeXl,
                            fontWeight: AppTypography.weightMedium,
                            letterSpacing: AppTypography.trackingSmall,
                            height: AppTypography.leadingTight,
                          ),
                        ),
                        const SizedBox(height: 24),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(19),
                          ),
                          child: Text(
                            formatTime(prepareSeconds),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),

                        AppButton(
                          width: 140,
                          height: 50,
                          label: "Start Now",
                          padding: EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 8,
                          ),
                          textColor: theme.colorScheme.primary,
                          backgroundColor: theme.colorScheme.onPrimary,
                          borderRadius: 19,
                          onTap: () => onStartPressed(),
                          textStyle: TextStyle(
                            fontWeight: AppTypography.weightBold,
                            letterSpacing: AppTypography.trackingMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
