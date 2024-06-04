import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../alert/alert_helper.dart';
import '../../../style/my_colors.dart';
import '../../register_competition/suit/components/register_bank_bottomsheet.dart';
import '../logic/payment_controller.dart';

class PaymentButton extends StatelessWidget {
  final String priceText;
  final String descText;
  const PaymentButton({required this.priceText, required this.descText, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PaymentController(),
      builder: (PaymentController controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          border: Border(
            top: BorderSide(width: 1, color: MyColors.grey300),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${priceText}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: MyColors.primaryColor,
                        ),
                      ),
                      Text(
                        '₮',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: 'Arial',
                          color: MyColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${descText}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: MyColors.grey500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 32),
            Expanded(
              child: Obx(
                () => controller.state.isLoading.value
                    ? const Center(child: CupertinoActivityIndicator(color: Colors.white))
                    : ElevatedButton(
                        onPressed: () async {
                          var (isSuccess, response) = await controller.generateQpay();
                          if (isSuccess) {
                            Get.bottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                              ),
                              RegisterBankBottomSheet(bankList: response['result']['urls']),
                            );
                          } else {
                            AlertHelper.showFlashAlert(title: 'Уучлаарай', message: response['message'] ?? 'Хүсэлт амжилтгүй');
                          }
                        },
                        child: Text(
                          'Төлбөр төлөх',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
