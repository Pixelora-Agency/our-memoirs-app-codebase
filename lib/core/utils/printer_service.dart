import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PrinterService {
  static Future<String?> printPhotoboxImage(Uint8List imageBytes) async {
    try {
      final Directory tempDir = await getTemporaryDirectory();
      final String filePath =
          '${tempDir.path}/photobox_${DateTime.now().millisecondsSinceEpoch}.png';

      final File imageFile = File(filePath);
      await imageFile.writeAsBytes(imageBytes);

      final pdf = pw.Document();
      final image = pw.MemoryImage(await imageFile.readAsBytes());

      pdf.addPage(
        pw.Page(
          pageFormat: const PdfPageFormat(288, 432, marginAll: 0),
          build: (pw.Context context) {
            return pw.Center(child: pw.Image(image, fit: pw.BoxFit.fill));
          },
        ),
      );

      final Uint8List pdfBytes = await pdf.save();

      final printers = await Printing.listPrinters();

      Printer? targetPrinter;

      if (printers.isNotEmpty) {
        try {
          targetPrinter = printers.firstWhere(
            (printer) => printer.name.toLowerCase().contains('l8050'),
          );
        } catch (_) {
          targetPrinter = printers.first;
        }
      }

      if (targetPrinter != null) {
        await Printing.directPrintPdf(
          printer: targetPrinter,
          onLayout: (PdfPageFormat format) async => pdfBytes,
          name: 'Ourmemoirs_photobox_print',
        );
      } else {
        throw Exception(
          "Printer tidak ditemukan atau tidak ada printer terhubung!",
        );
      }

      return filePath;
    } catch (e) {
      debugPrint("Failed to print: $e");
      rethrow;
    }
  }
}
