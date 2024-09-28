import 'package:flutter/material.dart';
<<<<<<< HEAD
<<<<<<< HEAD
=======
import 'package:flutter_riverpod/flutter_riverpod.dart';
>>>>>>> 4f2cacd (deneme1)
import 'package:xxx_barkod_tara/barcode_scanner_controller.dart';
import 'package:xxx_barkod_tara/barcode_scanner_listview.dart';
import 'package:xxx_barkod_tara/barcode_scanner_pageview.dart';
import 'package:xxx_barkod_tara/barcode_scanner_returning_image.dart';
import 'package:xxx_barkod_tara/barcode_scanner_window.dart';
import 'package:xxx_barkod_tara/barcode_scanner_zoom.dart';
import 'package:xxx_barkod_tara/deneme.dart';
import 'package:xxx_barkod_tara/home_page.dart';
import 'package:xxx_barkod_tara/mobile_scanner_overlay.dart';

void main() {
  runApp(
<<<<<<< HEAD
    MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      title: 'Mobile Scanner Example',
      home: const MyHome(),
=======
=======
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner_app_denemesi/barcode_scanner_controller.dart';
import 'package:mobile_scanner_app_denemesi/barcode_scanner_listview.dart';
import 'package:mobile_scanner_app_denemesi/barcode_scanner_pageview.dart';
import 'package:mobile_scanner_app_denemesi/barcode_scanner_returning_image.dart';
import 'package:mobile_scanner_app_denemesi/barcode_scanner_window.dart';
import 'package:mobile_scanner_app_denemesi/barcode_scanner_zoom.dart';
import 'package:mobile_scanner_app_denemesi/deneme.dart';
import 'package:mobile_scanner_app_denemesi/home_page.dart';
import 'package:mobile_scanner_app_denemesi/mobile_scanner_overlay.dart';

void main() {
  runApp(
>>>>>>> dc8de84 (28-9-2024)
    ProviderScope(
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        title: 'Mobile Scanner Example',
        home: const MyHome(),
      ),
<<<<<<< HEAD
>>>>>>> 4f2cacd (deneme1)
=======
>>>>>>> dc8de84 (28-9-2024)
    ),
  );
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Scanner Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DenemeScanner(),
                  ),
                );
              },
              child: const Text('Deneme'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BarcodeScannerSimple(),
                  ),
                );
              },
              child: const Text('MobileScanner Simple'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BarcodeScannerListView(),
                  ),
                );
              },
              child: const Text('MobileScanner with ListView'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BarcodeScannerWithController(),
                  ),
                );
              },
              child: const Text('MobileScanner with Controller'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BarcodeScannerWithScanWindow(),
                  ),
                );
              },
              child: const Text('MobileScanner with ScanWindow'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BarcodeScannerReturningImage(),
                  ),
                );
              },
              child: const Text(
                'MobileScanner with Controller (returning image)',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BarcodeScannerWithZoom(),
                  ),
                );
              },
              child: const Text('MobileScanner with zoom slider'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BarcodeScannerPageView(),
                  ),
                );
              },
              child: const Text('MobileScanner pageView'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
<<<<<<< HEAD
<<<<<<< HEAD
                    builder: (context) => BarcodeScannerWithOverlay(),
=======
                    builder: (context) => const BarcodeScannerWithOverlay(),
>>>>>>> 4f2cacd (deneme1)
=======
                    builder: (context) => const BarcodeScannerWithOverlay(),
>>>>>>> dc8de84 (28-9-2024)
                  ),
                );
              },
              child: const Text('MobileScanner with Overlay'),
            ),
          ],
        ),
      ),
    );
  }
}
