import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_alert_body.dart';
import 'base_snack_bar_body.dart';
import 'my_loading_dialog_body.dart';

enum AlertType { dialog, bottomSheet, snackBar }

///Апп-д зориулсан бүх төрлийн alert харуулах класс
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
  static Future<dynamic> showAlert({
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

        ///[Dialog] харуулах бол
        return Get.dialog(
          _baseBody,
          useSafeArea: true,
          barrierDismissible: dismissible,
        );

      ///[BottomSheet] харуулах бол
      case AlertType.bottomSheet:
        return Get.bottomSheet(
          _baseBody,
          ignoreSafeArea: false,
          isScrollControlled: isScrollable,
          isDismissible: dismissible,
        );

      ///[SnackBar] харуулах бол
      case AlertType.snackBar:
        if (Get.context == null) {
          return;
        }
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
        return null;
    }
  }

  ///Уншиж буй dialog харуулах функц
  static showLoadingAlert({String? message}) {
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
}
