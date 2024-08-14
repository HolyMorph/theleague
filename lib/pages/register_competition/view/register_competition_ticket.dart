import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style/my_colors.dart';
import '../logic/register_competition_controller.dart';
import '../suit/components/register_competition_appbar.dart';
import '../suit/components/selected_bank_button.dart';

class RegisterCompetitionTicket extends GetView<RegisterCompetitionController> {
  const RegisterCompetitionTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          RegisterCompetitionAppbar(coverUrl: controller.state.gameData['logo_rectangle']),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Тасалбарын тоо'),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 45,
                    child: ObxValue(
                      (ticket) => Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (controller.state.ticketCount.value > 1) controller.state.ticketCount.value--;
                            },
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              height: double.infinity,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(width: 1, color: MyColors.grey300),
                              ),
                              child: Icon(Icons.add, size: 20, color: MyColors.primaryColor),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              height: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(width: 1, color: MyColors.grey300),
                              ),
                              child: Text(
                                '$ticket',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          InkWell(
                            onTap: () {
                              controller.state.ticketCount.value++;
                            },
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              height: double.infinity,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(width: 1, color: MyColors.grey300),
                              ),
                              child: Icon(Icons.add, size: 20, color: MyColors.primaryColor),
                            ),
                          ),
                        ],
                      ),
                      controller.state.ticketCount,
                    ),
                  ),
                ],
              ).paddingAll(16),
            ),
          ),
          SelectedBankButton(),
          // PaymentButton(
          //   title: 'Төлбөр төлөх',
          //   onTap: () {
          //     Get.bottomSheet(
          //       isScrollControlled: true,
          //       backgroundColor: Colors.white,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          //       ),
          //       RegisterBankBottomSheet(),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
