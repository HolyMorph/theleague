import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../style/my_colors.dart';

class QrScanner extends StatelessWidget {
  QrScanner({super.key});
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final RxBool isDone = RxBool(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sport Lab QR'),
      ),
      body: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: (QRViewController controller) {
              controller.scannedDataStream.listen((scanData) {
                if (scanData.format == BarcodeFormat.qrcode) {
                  if (isDone.value) return;
                  if (!isDone.value) {
                    isDone.value = true;
                    Get.back(result: scanData.code);
                  }
                }
              });
            },
            overlay: QrScannerOverlayShape(
              borderColor: MyColors.primaryColor,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: 300,
            ),
          ),
          Positioned(
            top: (Get.size.height / 2) + 140,
            left: 0,
            right: 0,
            child: Text(
              'QR-аа уншуулна уу',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
