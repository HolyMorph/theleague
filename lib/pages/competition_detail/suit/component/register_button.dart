import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../style/my_colors.dart';
import '../../logic/competition_detail_controller.dart';

class RegisterButton extends GetView<CompetitionDetailController> {
  final VoidCallback onTap;
  final String title;
  const RegisterButton({required this.onTap, required this.title, super.key});

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
            if (gameData['registrationPrice'] > 0)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${gameData['registrationPrice']}',
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
                      '${gameData['registrationText']}',
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
            if (gameData['registrationPrice'] > 0) const SizedBox(width: 32),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () => onTap(),
                child: Text(
                  '${title}',
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
        controller.state.gameData,
      ),
    );
  }
}
