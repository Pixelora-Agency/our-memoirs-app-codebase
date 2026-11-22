import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrinterService {
  static const String _printerKey = 'selected_printer_name';

  static Future<String?> printPhotoboxImage(Uint8List imageBytes) async {
    try {
      final printers = await Printing.listPrinters();
      if (printers.isEmpty) {
        throw Exception("Printer not found or no printer connected.");
      }

      final prefs = await SharedPreferences.getInstance();
      final savedPrinterName = prefs.getString(_printerKey)?.trim();

      if (savedPrinterName == null || savedPrinterName.isEmpty) {
        throw Exception("No printer selected.");
      }

      Printer? targetPrinter;
      for (final printer in printers) {
        if (printer.name == savedPrinterName ||
            printer.name.toLowerCase().contains(
              savedPrinterName.toLowerCase(),
            )) {
          targetPrinter = printer;
          break;
        }
      }

      if (targetPrinter == null) {
        throw Exception("Printer not found.");
      }

      final Directory tempDir = await getTemporaryDirectory();
      final String filePath =
          '${tempDir.path}/photobox_${DateTime.now().millisecondsSinceEpoch}.png';

      final File imageFile = File(filePath);
      await imageFile.writeAsBytes(imageBytes);

      final pdf = pw.Document();
      final image = pw.MemoryImage(await imageFile.readAsBytes());

      // 4R (4 x 6 inch) = 288 x 432 pt
      pdf.addPage(
        pw.Page(
          pageFormat: const PdfPageFormat(288, 432, marginAll: 0),
          build: (pw.Context context) {
            return pw.Center(child: pw.Image(image, fit: pw.BoxFit.fill));
          },
        ),
      );

      final Uint8List pdfBytes = await pdf.save();

      await Printing.directPrintPdf(
        printer: targetPrinter,
        onLayout: (PdfPageFormat format) async => pdfBytes,
        name: 'Ourmemoirs_photobox_print',
      );

      return filePath;
    } catch (e) {
      debugPrint("Failed to print: $e");
      rethrow;
    }
  }
}
