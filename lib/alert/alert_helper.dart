import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../style/my_colors.dart';
import 'flash_status.dart';

class AlertHelper {
  static void showDialog({required Widget message, required VoidCallback onTap}) {
    Get.dialog(
      AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: Color(0xFF272739),
        content: Container(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: Colors.white.withOpacity(0.1)),
            color: Color(0xFF272739),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: -75,
                child: Image.asset('assets/images/ic_dialog_body.png', scale: 3),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  message,
                  const SizedBox(height: 24),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF686874)),
                          onPressed: () => Get.back(),
                          child: Text(
                            'Үгүй',
                            style: TextStyle(fontFamily: 'GIP', fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: MyColors.secondaryColor),
                          onPressed: onTap,
                          child: Text(
                            'Тийм',
                            style: TextStyle(fontFamily: 'GIP', fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void showFlashAlert({required String title, required String message, FlashStatus status = FlashStatus.success}) {
    showFlash(
      context: Get.context!,
      duration: const Duration(seconds: 5),
      builder: (context, controller) {
        return FlashBar(
          position: FlashPosition.top,
          margin: const EdgeInsets.fromLTRB(16, 48, 16, 0),
          shouldIconPulse: false,
          useSafeArea: false,
          elevation: 0,
          padding: EdgeInsets.zero,
          backgroundColor: Color(0xFF272739),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          controller: controller,
          content: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Color(status == FlashStatus.success ? 0xff00ff47 : 0xffFF2E00),
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(4)),
                  ),
                  width: 8,
                  height: double.infinity,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(right: Radius.circular(4)),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontFamily: 'GIP',
                          ),
                        ),
                        const SizedBox(height: 4),
                        Expanded(
                          child: Text(
                            message,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'GIP',
                              fontWeight: FontWeight.w400,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

enum AlertType { dialog, bottomSheet, snackBar }
