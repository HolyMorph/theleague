import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../style/my_colors.dart';
import '../../competition_detail/suit/component/register_button.dart';
import '../suit/components/find_player_bottomsheet_body.dart';
import '../suit/components/register_competition_appbar.dart';
import '../suit/register_competition_routes.dart';

class RegisterCompetitionTeam extends StatelessWidget {
  RegisterCompetitionTeam({super.key});

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          RegisterCompetitionAppbar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Багийн нэр',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Багийн нэр'),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Багийн лого',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () async {
                        await _onImageButtonPressed(ImageSource.gallery);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1, color: MyColors.grey300),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image, color: MyColors.primaryColor),
                            const SizedBox(width: 8),
                            Text(
                              'Зураг сонгох',
                              style: TextStyle(
                                fontSize: 14,
                                color: MyColors.primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Багийн гишүүд (3-4)',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: () {
                        Get.bottomSheet(
                          FindPlayerBottomSheetBody(),
                          backgroundColor: Colors.white,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.transparent,
                          border: Border.all(width: 1, color: MyColors.grey300),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person_add_alt_rounded, color: MyColors.primaryColor),
                            const SizedBox(width: 8),
                            Text(
                              'Тамирчин нэмэх',
                              style: TextStyle(
                                fontSize: 14,
                                color: MyColors.primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ).paddingAll(16),
            ),
          ),
          RegisterButton(
            onTap: () => Get.toNamed(RegisterCompetitionRoutes.registerCompetitionConfirmation),
          ),
        ],
      ),
    );
  }

  Future<void> _onImageButtonPressed(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 200,
        maxHeight: 100,
        imageQuality: 80,
      );

      log('sda :${pickedFile?.name}');
    } catch (e) {
      debugPrint('${e}');
    }
  }
}
