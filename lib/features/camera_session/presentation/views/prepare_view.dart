import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class PrepareView extends StatelessWidget {
  final int prepareSeconds;
  final CameraController? controller;
  final VoidCallback onStartPressed;

  const PrepareView({
    super.key,
    required this.prepareSeconds,
    required this.controller,
    required this.onStartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // 1. BACKGROUND: Live Preview Kamera (jika controller sudah siap di background)
        if (controller != null && controller!.value.isInitialized)
          Positioned.fill(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                // Pakai aspectRatio langsung agar ukurannya selalu valid dan tidak 0
                width: controller!.value.aspectRatio > 0
                    ? controller!.value.aspectRatio
                    : 16 / 9,
                height: 1.0,
                child: CameraPreview(controller!),
              ),
            ),
          )
        else
          Container(
            color: Colors.black,
          ), // Fallback hitam jika kamera masih loading
        // 2. BACKDROP / OVERLAY GELAP TRANSPARAN
        Container(color: Colors.black.withValues(alpha: 0.7)),

        // 3. KONTEN UTAMA (UI Teks, Timer, & Tombol)
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 48.0,
              vertical: 32.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Atas (Logo & Info Sesi)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Our Memoirs",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Serif',
                        fontSize: 24,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          "12 September 2026",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "20:30 | Take 1\nEatime Stories",
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),

                // Konten Tengah (Get Ready, Timer, Start Button)
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Get Ready!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Your session will start in",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        const SizedBox(height: 20),

                        // Kotak Timer (00:10)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.4),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white24),
                          ),
                          child: Text(
                            "00:${prepareSeconds.toString().padLeft(2, '0')}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 36),

                        // Tombol Start Now
                        SizedBox(
                          width: 220,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: onStartPressed,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              "Start Now",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
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
