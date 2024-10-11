import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../../style/my_colors.dart';
import '../logic/profile_controller.dart';
import '../suit/components/check_bottomsheet_body.dart';

class CheckerQrScanner extends GetWidget<ProfileController> {
  const CheckerQrScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sport Lab QR'),
      ),
      body: ObxValue(
        (isLoading) {
          return Stack(
            children: [
              Stack(
                children: [
                  QRView(
                    key: controller.state.qrKey,
                    onQRViewCreated: (QRViewController qrController) {
                      qrController.scannedDataStream.listen((scanData) async {
                        if (scanData.format == BarcodeFormat.qrcode) {
                          if (controller.state.isDone) return;
                          if (!controller.state.isDone) {
                            controller.state.isDone = true;
                            qrController.stopCamera();
                            if (scanData.code != null) {
                              var (isSuccess, response) = await controller.readQr(code: scanData.code ?? '');
                              if (isSuccess) {
                                bool? refresh = await Get.bottomSheet(
                                  CheckBottomSheetBody(athleteInfo: response['result']),
                                  isScrollControlled: true,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                  ),
                                );
                                if (refresh ?? false) {
                                  qrController.resumeCamera();
                                  controller.state.isDone = false;
                                }
                              }
                            }
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
              if (isLoading.value)
                ColoredBox(
                  color: Colors.white.withOpacity(0.3),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: MyColors.primaryColor,
                    ),
                  ),
                ),
            ],
          );
        },
        controller.state.checkerLoading,
      ),
    );
  }
}
