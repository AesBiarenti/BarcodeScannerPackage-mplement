import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:xxx_barkod_tara/barcode_scanner_window.dart';
import 'package:xxx_barkod_tara/scanned_barcode_label.dart';

class DenemeScanner extends StatefulWidget {
  const DenemeScanner({super.key});

  @override
  State<DenemeScanner> createState() => _DenemeScannerState();
}

class _DenemeScannerState extends State<DenemeScanner> {
  Barcode? _barcode;
  final MobileScannerController controller = MobileScannerController(
    formats: const [BarcodeFormat.qrCode],
  );
  Widget _buildBarcode(Barcode? value) {
    if (value == null) {
      return const Text(
        'Scan something!',
        overflow: TextOverflow.fade,
        style: TextStyle(color: Colors.white),
      );
    }

    return Text(
      value.displayValue ?? 'No display value.',
      overflow: TextOverflow.fade,
      style: const TextStyle(color: Colors.white),
    );
  }

  void _handleBarcode(BarcodeCapture barcodes) {
    if (mounted) {
      setState(() {
        _barcode = barcodes.barcodes.firstOrNull;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.sizeOf(context).center(Offset.zero),
      width: 200,
      height: 200,
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Simple scanner')),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: MobileScanner(
                  fit: BoxFit.cover,
                  scanWindow: scanWindow,
                  onDetect: _handleBarcode,
                  overlayBuilder: (context, constraints) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child:
                            ScannedBarcodeLabel(barcodes: controller.barcodes),
                      ),
                    );
                  },
                ),
              ),
              ValueListenableBuilder(
                valueListenable: controller,
                builder: (context, value, child) {
                  if (!value.isInitialized ||
                      !value.isRunning ||
                      value.error != null) {
                    return const SizedBox();
                  }

                  return CustomPaint(
                    painter: ScannerOverlay(scanWindow),
                  );
                },
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 100,
              color: Colors.black.withOpacity(0.4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: Center(child: _buildBarcode(_barcode))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
