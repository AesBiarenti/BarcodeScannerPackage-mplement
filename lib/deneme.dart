<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
<<<<<<< HEAD
import 'package:xxx_barkod_tara/barcode_scanner_window.dart';
import 'package:xxx_barkod_tara/scanned_barcode_label.dart';
=======
>>>>>>> 4f2cacd (deneme1)
=======
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
>>>>>>> dc8de84 (28-9-2024)

class DenemeScanner extends StatefulWidget {
  const DenemeScanner({super.key});

  @override
  State<DenemeScanner> createState() => _DenemeScannerState();
}

class _DenemeScannerState extends State<DenemeScanner> {
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
  List<String> scannedBarcodes = []; // Barkodları saklamak için liste
  bool isCameraOpen = false;
=======
  List<String> scannedBarcodes = []; // Barkodları saklamak için liste
  bool isCameraOpen = false;
  bool canScan = true; // Barkod tarama izni kontrolü
>>>>>>> dc8de84 (28-9-2024)

  void _toggleCamera() {
    if (isCameraOpen) {
      Navigator.of(context).pop(); // Modal'ı kapat
    } else {
      _openCameraModal(); // Modal'ı aç
    }
  }

  void _openCameraModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.black,
      builder: (BuildContext context) {
        return CameraSheet(
          onBarcodeScanned: (String barcode) {
<<<<<<< HEAD
            setState(() {
              scannedBarcodes.add(barcode); // Barkodu listeye ekle
            });
=======
            if (canScan) {
              setState(() {
                scannedBarcodes.add(barcode); // Barkodu listeye ekle
                canScan = false; // Tarama işlemini beklemeye al
              });
              _startScanDelay(); // 2 saniye bekleme
            }
>>>>>>> dc8de84 (28-9-2024)
          },
        );
      },
    ).whenComplete(() {
      setState(() {
        isCameraOpen = false; // Modal kapatıldığında durumu güncelle
      });
    });
<<<<<<< HEAD
>>>>>>> 4f2cacd (deneme1)
=======
  }

  // Tarama işlemini 2 saniye geciktirmek için zamanlayıcı
  void _startScanDelay() {
    Timer(const Duration(seconds: 2), () {
      setState(() {
        canScan = true; // 2 saniye sonra tekrar tarama yapılabilir
      });
    });
>>>>>>> dc8de84 (28-9-2024)
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
=======
>>>>>>> dc8de84 (28-9-2024)
    return Scaffold(
      appBar: AppBar(title: const Text('Barkod Tarayıcı')),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Barkod listesini gösteren widget
          Expanded(
            child: ListView.builder(
              itemCount: scannedBarcodes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    scannedBarcodes[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _toggleCamera,
              child: Text(isCameraOpen ? 'Kamerayı Kapat' : 'Kamerayı Aç'),
            ),
          ),
        ],
      ),
    );
  }
}

class CameraSheet extends StatefulWidget {
  final Function(String)
      onBarcodeScanned; // Barkod tarandığında çağrılacak fonksiyon

  const CameraSheet({super.key, required this.onBarcodeScanned});

  @override
  State<CameraSheet> createState() => _CameraSheetState();
}

class _CameraSheetState extends State<CameraSheet> {
  MobileScannerController controller = MobileScannerController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _handleBarcode(BarcodeCapture barcodes) {
    final String barcode = barcodes.barcodes.firstOrNull?.displayValue ?? '';
    if (barcode.isNotEmpty) {
      widget.onBarcodeScanned(barcode); // Barkodu üst widget'a ilet
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: [
          Expanded(
            child: MobileScanner(
              controller: controller,
              onDetect: _handleBarcode,
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Barkod Bekleniyor...',
              style: TextStyle(color: Colors.white),
<<<<<<< HEAD
>>>>>>> 4f2cacd (deneme1)
=======
>>>>>>> dc8de84 (28-9-2024)
            ),
          ),
        ],
      ),
    );
  }
}
