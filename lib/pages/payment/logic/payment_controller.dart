import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../alert/alert_helper.dart';
import '../../../service/method.dart';
import '../../../service/my_client.dart';
import '../../../style/my_colors.dart';
import '../../../utils/fa_icon.dart';
import '../../core/suit/core_routes.dart';
import '../../register_competition/logic/register_competition_controller.dart';
import '../state/payment_state.dart';

class PaymentController extends FullLifeCycleController with FullLifeCycleMixin {
  final state = PaymentState();

  @override
  void onDetached() {}

  @override
  void onHidden() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {
    if (Get.isDialogOpen!) Get.back();
    if (Get.isBottomSheetOpen!) Get.back();
    paymentChecker();
    checkInvoice();
  }

  Future<(bool, dynamic)> generateQpay() async {
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient().sendHttpRequest(
      urlPath: 'api/pmnt/generate-game-invoice',
      method: Method.post,
      body: {
        'gameCode': '${Get.find<RegisterCompetitionController>().state.entityDetail['game_code']}',
        'entryCode': '${Get.find<RegisterCompetitionController>().state.entityDetail['entryCode']}',
      },
    );
    state.isLoading.value = false;
    return (isSuccess, response);
  }

  Future<(bool, dynamic)> checkInvoice() async {
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient().sendHttpRequest(
      urlPath: 'api/pmnt/check-payment',
      method: Method.post,
      body: {
        'gameCode': '${Get.find<RegisterCompetitionController>().state.entityDetail['game_code']}',
        'entryCode': '${Get.find<RegisterCompetitionController>().state.entityDetail['entryCode']}',
      },
    );
    state.isLoading.value = false;
    if (isSuccess) {
      if (response['result']['entryStatus'] == 'ready' || response['result']['entryStatus'] == 'owner-ready') {
        if (Get.find<RegisterCompetitionController>().state.from.value.isNotEmpty) {
          Get.until((route) => Get.currentRoute == '${Get.find<RegisterCompetitionController>().state.from.value}');
        } else {
          Get.until((route) => Get.currentRoute == CoreRoutes.coreScreen);
        }
        AlertHelper.showFlashAlert(title: 'Амжилттай', message: 'Төлбөр амжилттай хийгдлээ');
      }
    } else {
      AlertHelper.showFlashAlert(title: 'Уучлаарай', message: response['message'] ?? 'Хүсэлт амжилтгүй');
    }
    return (isSuccess, response);
  }

  void paymentChecker() {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Obx(
          () => Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
            width: Get.size.width - 32,
            child: state.isLoading.value
                ? SizedBox(height: 100, child: const CupertinoActivityIndicator())
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1, color: MyColors.grey200),
                            ),
                            child: Text(
                              FaIcon.wallet,
                              style: FaIcon.regular().copyWith(fontSize: 16, color: MyColors.neutral900),
                            ),
                          ),
                          IconButton(onPressed: () => Get.back(), icon: Icon(Icons.close)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Хураамжийн төлөлт шалгах',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: MyColors.neutral900,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Төлөв: ',
                            style: TextStyle(fontSize: 14, color: MyColors.grey600),
                          ),
                          Text(
                            'Төлөгдөөгүй',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: MyColors.errorColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          checkInvoice();
                        },
                        child: Text('Төлбөр шалгах'),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
