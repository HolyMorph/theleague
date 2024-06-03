import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../style/my_colors.dart';
import '../../logic/register_competition_controller.dart';

class PaymentButton extends GetView<RegisterCompetitionController> {
  final String title;
  final VoidCallback onTap;
  const PaymentButton({required this.title, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        border: Border.all(width: 1, color: MyColors.grey400),
        color: Colors.white,
      ),
      child: ObxValue(
        (gameData) => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      '${(gameData['registrationPrice'] * controller.state.ticketCount.value)}',
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
                  '${gameData['registrationText']}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: MyColors.grey500,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 32),
            Expanded(
              child: ElevatedButton(
                onPressed: () => onTap(),
                child: Text('${title}'),
              ),
            ),
          ],
        ),
        controller.state.gameData,
      ),
    );
  }
}
