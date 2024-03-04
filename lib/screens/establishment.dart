import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class EstablishmentSceen extends StatelessWidget {
  const EstablishmentSceen({super.key});

  void scanQR() async {
    final lineColor = '#ffffff';
    final cancelButtonText = 'CANCEL';
    final isShowFlashIcon = true;
    final scanMode = ScanMode.DEFAULT;
    final qr = await FlutterBarcodeScanner.scanBarcode(
        lineColor, cancelButtonText, isShowFlashIcon, scanMode);
    print(qr);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Establishment'),
        centerTitle: true,
      ),
      body: Container(
        child: ElevatedButton(
          onPressed: scanQR,
          child: Text('Scan'),
        ),
      ),
    );
  }
}
