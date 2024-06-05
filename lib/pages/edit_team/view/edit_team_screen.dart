import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../alert/alert_helper.dart';
import '../../../alert/flash_status.dart';
import '../../../style/my_colors.dart';
import '../../my_teams/logic/my_teams_controller.dart';
import '../../settings/suit/components/settings_textfield.dart';
import '../logic/edit_team_controller.dart';
import '../suit/components/edit_image_picker.dart';
import '../suit/components/edit_team_owner_button.dart';
import '../suit/components/edit_team_selection.dart';

class EditTeamScreen extends GetView<EditTeamController> {
  const EditTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Багийн мэдээлэл',
          style: TextStyle(fontSize: 18),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight - 50),
          child: const SizedBox(),
        ),
      ),
      body: Obx(
        () => controller.state.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(color: MyColors.primaryColor),
              )
            : Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SettingsTextField(
                                title: 'Багийн нэр',
                                isActive: controller.state.isMeOwner.value,
                                initialValue: controller.state.myTeam['team']['name'],
                                hintText: 'Багийн нэр',
                                onChanged: (input) => controller.state.newTeamName.value = input,
                                isRequired: true,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Хүйс',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.grey700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              TextFormField(
                                enabled: false,
                                initialValue: controller.state.myTeam['team']['gender'] == 'male' ? 'Эрэгтэй' : 'Эмэгтэй',
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Төрөл',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.grey700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              TextFormField(
                                enabled: false,
                                initialValue: controller.state.myTeam['team']['sportCategory'],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Text(
                                    'Багийн Лого',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: MyColors.grey700,
                                    ),
                                  ),
                                  Text(
                                    '*',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: MyColors.redColor,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              EditImagePicker(),
                              const SizedBox(height: 16),
                              EditTeamSelection(),
                            ],
                          ).paddingAll(16),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 2),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 1),
                              color: MyColors.grey200,
                              blurRadius: 8,
                            ),
                          ],
                          border: Border.symmetric(
                            vertical: BorderSide(width: 1, color: MyColors.grey300),
                          ),
                        ),
                        child: controller.state.isMeOwner.value
                            ? EditTeamOwnerButton()
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: MyColors.errorColor.withOpacity(0.07),
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(width: 1, color: MyColors.statusFailed),
                                  ),
                                ),
                                onPressed: () async {
                                  var (isSuccess, response) = await controller.leaveTeam();
                                  if (isSuccess) {
                                    AlertHelper.showFlashAlert(title: 'Амжилттай', message: 'Багаас гарлаа');
                                    Get.back();
                                    Get.find<MyTeamsController>().getMyTeams();
                                  } else {
                                    AlertHelper.showFlashAlert(
                                      title: 'Алдаа',
                                      message: response['message'] ?? 'Хүсэлт амжилтгүй',
                                      status: FlashStatus.failed,
                                    );
                                  }
                                },
                                child: Text(
                                  'Багаас гарах',
                                  style: TextStyle(fontSize: 16, color: MyColors.statusFailed),
                                ),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
