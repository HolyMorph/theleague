import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../style/my_colors.dart';
import 'flash_status.dart';

class AlertHelper {
  static void showDialog({required String message, required VoidCallback onTap}) {
    Get.dialog(
      AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: Color(0xFF272739),
        content: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Color(0xFF272739),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                message,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'GIP',
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: MyColors.secondaryColor),
                onPressed: onTap,
                child: Text('Үргэлжлүүлэх'),
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
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Color(status == FlashStatus.success ? 0xff00ff47 : 0xffFF2E00),
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4)),
                    ),
                    child: Image.asset(
                      status == FlashStatus.failed ? 'assets/icons/ic_failed.png' : 'assets/icons/ic_success.png',
                      scale: 2,
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
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
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                        const SizedBox(height: 4),
                        Expanded(
                          child: Text(
                            message,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
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
