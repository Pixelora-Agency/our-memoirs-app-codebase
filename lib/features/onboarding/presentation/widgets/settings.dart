import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_memoirs_codebase/core/constants/app_colors.dart';
import 'package:our_memoirs_codebase/core/constants/app_typo.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_dropdown.dart';

import '../bloc/device_setting_cubit.dart';
import '../bloc/device_setting_state.dart';

class SettingsWidgets extends StatelessWidget {
  final List<String> availablePrinters;

  const SettingsWidgets({super.key, this.availablePrinters = const []});

  String _formatCameraLabel(String rawName, String fallbackLens) {
    final trimmed = rawName.trim();
    if (trimmed.isEmpty) {
      return 'Camera ($fallbackLens)';
    }

    final cleaned = trimmed.split('<').first.split('(').first.trim();

    return cleaned.isNotEmpty ? cleaned : trimmed;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviceSettingCubit, DeviceSettingState>(
      builder: (context, state) {
        final cubit = context.read<DeviceSettingCubit>();

        final cameraItems = state.cameras
            .map(
              (cam) => Item(
                label: _formatCameraLabel(cam.name, cam.lensDirection.name),
                value: cam.name, // tetap pakai cam.name asli untuk pencocokan
              ),
            )
            .toList();

        final selectedCameraValue =
            state.selectedCamera?.name ??
            (cameraItems.isNotEmpty ? cameraItems.first.value : '');

        final formattedSelectedCamera = selectedCameraValue.isEmpty
            ? '-'
            : _formatCameraLabel(
                selectedCameraValue,
                state.selectedCamera?.lensDirection.name ?? '',
              );

        final printerItems = availablePrinters
            .map((p) => Item(label: p, value: p))
            .toList();

        final hasSavedPrinter =
            state.selectedPrinter != null &&
            availablePrinters.contains(state.selectedPrinter);

        final selectedPrinterValue = hasSavedPrinter
            ? state.selectedPrinter!
            : (printerItems.isNotEmpty ? printerItems.first.value : '');

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Device Settings',
                  style: AppTypography.bodyMedium.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary700,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 12),

            if (state.errorMessage != null) ...[
              Text(
                state.errorMessage!,
                style: AppTypography.bodyMedium.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
              const SizedBox(height: 12),
            ],

            Text(
              'Camera',
              style: AppTypography.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.primary700,
              ),
            ),
            const SizedBox(height: 6),

            if (cameraItems.isEmpty)
              Text(
                state.isInitializingCamera
                    ? 'Mount Camera...'
                    : 'Camera Not Found',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.primary700,
                ),
              )
            else
              AppDropdown(
                key: ValueKey('cam_$selectedCameraValue'),
                item: cameraItems,
                initialValue: selectedCameraValue,
                onSelected: (value) {
                  if (value == null) return;
                  final matched = state.cameras.where((c) => c.name == value);
                  if (matched.isNotEmpty) {
                    cubit.selectCamera(matched.first);
                  }
                },
              ),

            if (state.isInitializingCamera) ...[
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Initializing Camera...',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.primary700,
                    ),
                  ),
                ],
              ),
            ],

            const SizedBox(height: 16),
            Text(
              'Printer',
              style: AppTypography.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.primary700,
              ),
            ),
            const SizedBox(height: 6),

            if (printerItems.isEmpty)
              Text(
                'Unavailable Printer',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.primary700,
                ),
              )
            else
              AppDropdown(
                key: ValueKey('printer_$selectedPrinterValue'),
                item: printerItems,
                initialValue: selectedPrinterValue,
                onSelected: (value) {
                  if (value != null) {
                    cubit.selectPrinter(value);
                  }
                },
              ),

            const SizedBox(height: 14),
            Text(
              'Selected Camera: $formattedSelectedCamera',
              style: AppTypography.bodyMedium.copyWith(
                fontSize: 12,
                color: AppColors.primary700,
              ),
            ),
            Text(
              'Selected Printer: ${selectedPrinterValue.isEmpty ? "Unavailable Printer" : selectedPrinterValue}',
              style: AppTypography.bodyMedium.copyWith(
                fontSize: 12,
                color: AppColors.primary700,
              ),
            ),
          ],
        );
      },
    );
  }
}
