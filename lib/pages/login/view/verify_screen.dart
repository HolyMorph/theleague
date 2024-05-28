import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/pin_input.dart';
import '../../../style/my_colors.dart';
import '../../../utils/basic_utils.dart';
import '../logic/login_controller.dart';

class VerifyScreen extends GetView<LoginController> {
  const VerifyScreen({super.key});

  @override
  StatelessElement createElement() {
    controller.startResendTimer();
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              'Миний бүртгэл',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight - 20),
          child: const SizedBox(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Баталгаажуулах',
                    style: const TextStyle(color: MyColors.grey900, fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Та цахим хаягтаа ирсэн баталгаажуулах кодыг оруулна уу. ',
                    style: const TextStyle(color: MyColors.grey700, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            PinInput(
              length: 6,
              onChanged: (input) {},
              onCompleted: (otpCode) async {
                // var (isSuccess, response) = await controller.checkOTP();
                // if (!isSuccess) {
                //   AlertUtils.showErrorFlashAlert(response: response);
                // }
              },
            ),
            const SizedBox(height: 16),
            Obx(
              () => InkWell(
                onTap: !controller.state.resendActivated.value
                    ? null
                    : () async {
                        // controller.startResendTimer();
                        // var (isSuccess, response) = await controller.login();
                        // if (isSuccess) {
                        //   AlertUtils.showFlashAlert(text: 'login_success'.tr, subText: 'login_otp_resend'.tr);
                        //   controller.state.resendActivated.value = false;
                        // } else {
                        //   AlertUtils.showErrorFlashAlert(response: response);
                        // }
                      },
                borderRadius: BorderRadius.circular(8),
                child: Obx(
                  () => Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: controller.state.resendActivated.value ? MyColors.primaryColor : Colors.transparent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Код дахин авах ',
                          style: const TextStyle(fontSize: 16, color: MyColors.grey400, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '( ${BasicUtils.formattedTime(controller.state.resendDuration.value)} )',
                          style: const TextStyle(fontSize: 16, color: MyColors.primaryColor, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Obx(
              () => ElevatedButton(
                onPressed: controller.state.otpCode.value.length < 6
                    ? null
                    : () async {
                        // var (isSuccess, response) = await controller.checkOTP();
                        // if (!isSuccess) {
                        //   AlertUtils.showErrorFlashAlert(response: response);
                        // }
                      },
                child: controller.state.isLoading.value
                    ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white))
                    : Text('Үргэлжлүүлэх'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
