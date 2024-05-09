import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../../components/app_back_button.dart';
import '../../../../style/my_colors.dart';
import '../logic/coach_verify_controller.dart';

class CoachVerifyScreen extends GetView<CoachVerifyController> {
  CoachVerifyScreen({super.key});

  ///It is used in 2 different places at the same time.
  final defaultPinTheme = PinTheme(
    width: 40,
    height: 40,
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
    decoration: BoxDecoration(color: Color(0xFF2D2E40), borderRadius: BorderRadius.circular(10)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: AppBackButton(),
        title: Text('Багийн санал өгөх'),
        centerTitle: true,
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
              'Та 8 оронтой нэг удаагын кодоо оруулна уу.',
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
              'Таны өгсөн санал нийт саналын 30%-ыг эзлэх бөгөөд та нэг удаа л саналаа өгөх боломжтойг анхаарна уу.',
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
                    length: 8,
                    defaultPinTheme: defaultPinTheme,
                    onChanged: (input) => controller.coachCode = input,
                    onCompleted: (input) => controller.checkCoach(),
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
                      onPressed: controller.state.coachCode.value.length < 8 ? null : () => controller.checkCoach(),
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
}
