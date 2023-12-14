import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../style/my_colors.dart';
import 'base_alert_body.dart';
import 'base_snack_bar_body.dart';
import 'flash_status.dart';
import 'my_loading_dialog_body.dart';

/// Апп-д зориулсан бүх төрлийн alert харуулах класс.
class AlertHelper {
  /// ╔════════════════════════════════════════════════════════════════════════════╗
  /// ║ Alert харуулах үндсэн функцүүд                                             ║
  /// ║                                                                            ║
  /// ║                                                                            ║
  /// ║                                                                            ║
  /// ╚════════════════════════════════════════════════════════════════════════════╝
  ///
  ///
  /// Мэдээлэл харуулах харагдацын төрөл сонгохдоо [type] параметр ашиглан
  /// [Dialog], [BottomSheet], [SnackBar] -ийн алийг нь ашиглаж харуулахаа шийднэ.
  /// Өгөгдмөл анхны утга нь [AlertType.dialog] төрөлтэй байна.
  ///
  /// Гарчигны мэдээлэллийг [title], тайлбарын мэдээллийг
  /// [message] параметрээр дамжуулна. Гарчиг болон тайлбар текстийн
  /// хооронд зураг лого гэх мэт өөр зүйл харуулахаар бол [image] параметрийг ашиглана.
  ///
  /// [Dialog] нь үйлдлийг хүлээн зөвшөөрөх эсвэл үл зөвшөөрөх гэсэн 2 товчлууртай бөгөөд
  /// зөвшөөрөх товчлуурын мэдээллийг [positiveText] болон [onPositiveClicked] параметрээр
  /// харин үл зөвшөөрөх үйлдлийг [negativeText] болон [onNegativeClicked] параметрээр дамжуулна.
  /// Хэрвээ товчлууруудын утгыг явуулахгүй тохиолдолд [positiveText] нь 'Хаах' гэсэн утга авах
  /// бөгөөд дарсан тохиолдолд [Dialog]-г хаах үйлдэл хийнэ харин нөгөө товчлуур нь харагдахгүй
  ///
  /// Үндсэн загвараас өөр загварын [Dialog] харуулах гэж байгаа бол [child] параметрээр тухайн
  /// харагдацаа дамжуулж өгнө. Хэрвээ [replaceWholeWidget] параметрийн утгыг <true> гэж өгвөл dialog
  /// тэр чигтээ солигдоно <false> тохиолдолд [Dialog]-ийн зөвхөн дотоод хэсэг өөрчлөгдөнө.
  ///
  /// API сервис дуудаад тухайн сервис алдаатай ирсэн тохиолдолд алдааны мсж
  /// харуулахаар бол энэ функц руу тухайн ирсэн [response]-оо дамжуулж алдааны мсж харуулна.
  /// [response]-ийн бүтэц нь тухайн сервисээс хамаарч өөр өөр байх тул өөрийн ашиглаж буй сервистээ
  /// тааруулж алдааны мсж-ээ авна
  // ignore: long-parameter-list, long-method
  static Future<void> showAlert<T>({
    AlertType type = AlertType.dialog,
    String? title,
    Widget? image,
    String? message,
    String? positiveText,
    Function()? onPositiveClicked,
    String? negativeText,
    Function()? onNegativeClicked,
    Widget? child,
    bool replaceWholeWidget = false,
    dynamic response,
    bool isScrollable = false,
    bool dismissible = true,
  }) async {
    Widget _baseBody = BaseAlertBody(
      type: type,
      title: title,
      message: message,
      onPositiveClicked: onPositiveClicked,
      onNegativeClicked: onNegativeClicked,
      image: image,
      positiveText: positiveText,
      negativeText: negativeText,
      child: child,
      replaceWholeWidget: replaceWholeWidget,
      response: response,
      isScrollable: isScrollable,
    );
    switch (type) {
      case AlertType.dialog:

        /// [Dialog] харуулах бол.
        return Get.dialog(
          _baseBody,
          useSafeArea: true,
          barrierDismissible: dismissible,
        );

      /// [BottomSheet] харуулах бол.
      case AlertType.bottomSheet:
        return Get.bottomSheet(
          _baseBody,
          ignoreSafeArea: false,
          isScrollControlled: isScrollable,
          isDismissible: dismissible,
        );

      /// [SnackBar] харуулах бол.
      case AlertType.snackBar:
        if (Get.context == null) {
          return null;
        }
        showSnackBar();
        return null;
    }
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

  /// Уншиж буй dialog харуулах функц.
  static void showLoadingAlert({String? message}) {
    showAlert(
      child: MyLoadingDialogBody(message: message),
      dismissible: false,
    );
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        if (Get.isDialogOpen ?? false) {
          Get.back();
        }
      },
    );
  }

  // FlashAlert(
  // status: FlashStatus.failed,
  // message: 'Уучлаарай',
  // title: 'Та одоогоор санал өгөх боломжгүй байна.',
  // ),

  /// [SnackBar] харуулах функц.
  static void showSnackBar({
    Widget? child,
    String? title,
    String? message,
    Widget? image,
    String? positiveText,
    Function()? onPositiveClicked,
  }) {
    ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            child ??
                BaseSnackBarBody(
                  title: title,
                  message: message,
                  icon: image,
                ),
          ],
        ),
        action: (onPositiveClicked != null)
            ? SnackBarAction(
                label: positiveText ?? 'Хаах',
                onPressed: onPositiveClicked,
              )
            : null,
        elevation: 2,
      ),
    );
  }
}

enum AlertType { dialog, bottomSheet, snackBar }
