import 'package:apollo23_app/widgets/treasury_response.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class TreasuryScannerWidget extends StatelessWidget {
  const TreasuryScannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    MobileScannerController cameraController = MobileScannerController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tesouro scanner'),
        actions: [
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.torchState,
              builder: (context, state, child) {
                switch (state) {
                  case TorchState.off:
                    return const Icon(Icons.flash_off, color: Colors.grey);
                  case TorchState.on:
                    return const Icon(Icons.flash_on, color: Colors.yellow);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.toggleTorch(),
          ),
          IconButton(
            color: Colors.grey,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.cameraFacingState,
              builder: (context, state, child) {
                switch (state) {
                  case CameraFacing.front:
                    return const Icon(Icons.camera_front);
                  case CameraFacing.back:
                    return const Icon(Icons.camera_rear);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.switchCamera(),
          ),
        ],
      ),
      body: MobileScanner(
        controller: cameraController,
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          //final Uint8List? image = capture.image;
          String? barcodeValue = '';
          for (final barcode in barcodes) {
            debugPrint('Barcode found! ${barcode.rawValue}');
            barcodeValue = barcode.rawValue;
            cameraController.stop();
            cameraController.dispose();
            break;
          }
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) =>
                TreasuryResponseWidget(qrCode: barcodeValue!, closeScanner: () => Navigator.of(context).pop()),
          );
        },
      ),
    );
  }
}
