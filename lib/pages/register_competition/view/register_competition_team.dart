import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../style/my_colors.dart';
import '../../../utils/fa_icon.dart';
import '../../competition_detail/suit/component/register_button.dart';
import '../logic/register_competition_controller.dart';
import '../suit/components/find_player_bottomsheet_body.dart';
import '../suit/components/register_competition_appbar.dart';
import '../suit/register_competition_routes.dart';

class RegisterCompetitionTeam extends GetView<RegisterCompetitionController> {
  RegisterCompetitionTeam({super.key});

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgColor,
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
                      color: MyColors.greyBlue800,
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
                      color: MyColors.greyBlue800,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ObxValue(
                    (image) => image.value != null
                        ? Row(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: MyColors.grey300),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.file(
                                  File(image.value?.path ?? ''),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Material(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                child: InkWell(
                                  onTap: () {
                                    controller.state.selectedLogo.value = null;
                                  },
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: MyColors.grey300),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          FaIcon.trash,
                                          style: FaIcon.regular().copyWith(
                                            color: MyColors.greyBlue800,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          'Устгах',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: MyColors.greyBlue800,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                clipBehavior: Clip.hardEdge,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: MyColors.grey300),
                                  borderRadius: BorderRadius.circular(8),
                                  color: MyColors.grey500.withOpacity(0.2),
                                ),
                                child: Text(
                                  FaIcon.image,
                                  style: FaIcon.regular().copyWith(
                                    fontSize: 20,
                                    color: MyColors.grey500,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Material(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                child: InkWell(
                                  onTap: () async {
                                    await _onImageButtonPressed(ImageSource.gallery);
                                  },
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: MyColors.grey300),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          FaIcon.upload_cloud,
                                          style: FaIcon.regular().copyWith(color: MyColors.greyBlue800, fontSize: 14),
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          'Зураг сонгох',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: MyColors.greyBlue800,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    controller.state.selectedLogo,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Багийн гишүүд (3-4)',
                    style: TextStyle(
                      fontSize: 14,
                      color: MyColors.greyBlue800,
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
      controller.state.selectedLogo.value = pickedFile;
    } catch (e) {
      debugPrint('${e}');
    }
  }
}
