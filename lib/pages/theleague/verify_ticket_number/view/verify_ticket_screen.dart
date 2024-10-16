import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../../alert/alert_helper.dart';
import '../../../../alert/flash_status.dart';
import '../../../../components/app_back_button.dart';
import '../../../../style/my_colors.dart';
import '../logic/verify_ticket_controller.dart';

class VerifyTicketScreen extends GetView<VerifyTicketController> {
  VerifyTicketScreen({super.key});

  ///It is used in 2 different places at the same time.
  final defaultPinTheme = PinTheme(
    width: 60,
    height: 60,
    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
    decoration: BoxDecoration(color: Color(0xFF2D2E40), borderRadius: BorderRadius.circular(10)),
  );

  @override
  StatelessElement createElement() {
    controller.getCurrentPosition();

    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: AppBackButton(),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 1),
          child: Container(height: 1, color: Colors.white.withOpacity(0.1)),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          children: [
            const SizedBox(height: 32),
            Text(
              'Та үзэж буй тоглолтын нууц кодыг оруулна уу.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'GIP',
                fontWeight: FontWeight.w700,
                shadows: [
                  Shadow(
                    offset: Offset(5, 5),
                    blurRadius: 8.0,
                    color: Colors.white.withOpacity(0.2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Зөвхөн тухайн өдрийн тоглолтууд дээр нууц кодыг зарлах бөгөөд, энэхүү санал өгөлт нь нийт саналын 40%-ыг эзлэнэ.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontFamily: 'GIP',
              ),
            ),
            const SizedBox(height: 64),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Pinput(
                    autofocus: true,
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    onChanged: (input) => controller.ticketCode = input,
                    onCompleted: (input) {
                      setOnTap();
                    },
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration?.copyWith(
                        border: Border.all(width: 1, color: MyColors.secondaryColor),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 1),
                            blurRadius: 8,
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Obx(
                    () => ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: MyColors.secondaryColor),
                      onPressed: controller.state.ticketCode.value.length < 6
                          ? null
                          : () {
                              setOnTap();
                            },
                      child: controller.state.isLoading.value
                          ? SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white))
                          : Text('Үргэлжлүүлэх'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setOnTap() async {
    if (await controller.handleLocationPermission()) {
      controller.isLoading = true;
      await controller.getCurrentPosition();
      await controller.checkTicket();
      controller.isLoading = false;
    } else {
      AlertHelper.showFlashAlert(
        title: 'Алдаа гарлаа',
        message: 'Байршил тогтоогчийн зөвшөөрөл өгснөөр үргэлжлүүлэх боломжтой',
        status: FlashStatus.failed,
      );
      controller.showLocationDialog();
    }
  }
}
