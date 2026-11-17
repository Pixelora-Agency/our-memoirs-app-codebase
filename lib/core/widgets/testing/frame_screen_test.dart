import 'package:flutter/material.dart';
import 'package:our_memoirs_codebase/features/frame_selection/data/frame_data.dart';
import 'package:our_memoirs_codebase/features/frame_selection/models/frame_models.dart';
import 'package:our_memoirs_codebase/features/frame_selection/presentation/widgets/frame_preview.dart';

class TestFrameScreen extends StatefulWidget {
  const TestFrameScreen({super.key});

  @override
  State<TestFrameScreen> createState() => _TestFrameScreenState();
}

class _TestFrameScreenState extends State<TestFrameScreen> {
  late FrameModel selectedFrame;

  @override
  void initState() {
    super.initState();
    selectedFrame = dataFrames.first;
  }

  @override
  Widget build(BuildContext context) {
    List<String> dummyPhotos = List.generate(
      selectedFrame.slotCount,
      (index) => 'assets/images/placeholder/image-1.png',
    );

    return Scaffold(
      appBar: AppBar(title: Text('Testing Frame: ${selectedFrame.name}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdown untuk ganti-ganti frame dan mengecek posisinya
            DropdownButton<FrameModel>(
              value: selectedFrame,
              isExpanded: true,
              items: dataFrames.map((frame) {
                return DropdownMenuItem<FrameModel>(
                  value: frame,
                  child: Text(
                    '${frame.id} - ${frame.name} (${frame.slotCount} Slot)',
                  ),
                );
              }).toList(),
              onChanged: (FrameModel? newFrame) {
                if (newFrame != null) {
                  setState(() {
                    selectedFrame = newFrame;
                  });
                }
              },
            ),
            const SizedBox(height: 20),

            // Preview Frame yang ingin diuji coba posisinya
            Expanded(
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: FramePreview(
                    frame: selectedFrame,
                    totalSlots: 1,
                    chanceRetake: 1,
                    capturedImagePaths: dummyPhotos, // Memasukkan dummy foto
                    onSlotTapped: (index) {
                      print("Slot ke-$index diklik untuk diganti!");
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
            const Text(
              "Cek apakah kotak hitam di belakang frame sudah pas posisinya.",
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
