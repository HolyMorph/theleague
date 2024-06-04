import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../alert/alert_helper.dart';
import '../../../alert/flash_status.dart';
import '../../../components/my_drop_down.dart';
import '../../../components/my_image_picker.dart';
import '../../../style/my_colors.dart';
import '../../../utils/fa_icon.dart';
import '../../register_competition/logic/register_competition_controller.dart';
import '../../settings/suit/components/settings_textfield.dart';
import '../logic/create_team_controller.dart';
import '../suit/component/team_member_selection.dart';

class CreateTeamScreen extends GetWidget<CreateTeamController> {
  const CreateTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Багийн мэдээлэл',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: ObxValue(
        (loading) => loading.value
            ? Center(
                child: const CircularProgressIndicator(color: MyColors.primaryColor),
              )
            : Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SettingsTextField(
                            title: 'Багийн нэр',
                            isActive: true,
                            hintText: 'Багийн нэр',
                            onChanged: (input) => controller.state.teamName.value = input,
                            isRequired: true,
                          ),
                          const SizedBox(height: 16),
                          MyDropDown(
                            title: 'Хүйс',
                            isRequired: true,
                            onChanged: (value) => controller.state.selectedGender.value = value,
                            selectedAbleList: ['Эрэгтэй', 'Эмэгтэй'],
                          ),
                          const SizedBox(height: 16),
                          MyDropDown(
                            title: 'Спортын төрөл',
                            isRequired: true,
                            onChanged: (value) => controller.state.selectedType.value = value,
                            selectedAbleList: List<String>.from(controller.state.sportTypes['list']),
                            dictionary: controller.state.sportTypes['dictionary'],
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
                          MyImagePicker(
                            selectedImage: controller.state.selectedImage,
                            isHaveCamera: false,
                            onDelete: () {
                              controller.state.logoUrl.value = '';
                            },
                          ),
                          const SizedBox(height: 16),
                          TeamMemberSelection(),
                        ],
                      ).paddingAll(16),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      border: Border.symmetric(vertical: BorderSide(width: 1, color: MyColors.grey300)),
                      boxShadow: [
                        BoxShadow(offset: const Offset(0, 1), color: MyColors.grey200, blurRadius: 8),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (controller.state.teamName.isNotEmpty &&
                            controller.state.selectedGender.isNotEmpty &&
                            controller.state.selectedType.isNotEmpty &&
                            controller.state.teamMembers.isNotEmpty &&
                            controller.state.selectedImage.value != null) {
                          var (isSuccess, response) = await controller.createTeam();
                          if (isSuccess) {
                            if (controller.state.from.isNotEmpty) {
                              Get.until((route) => Get.currentRoute == controller.state.from.value);
                              Get.find<RegisterCompetitionController>().getMyTeams();
                            } else {
                              Get.back();
                            }
                            AlertHelper.showFlashAlert(
                              title: 'Амжилттай',
                              message: 'Баг амжилттай үүслээ',
                            );
                          } else {
                            AlertHelper.showFlashAlert(
                              title: 'Уучлаарай',
                              message: response['message'] ?? 'Дахин оролдоно уу',
                              status: FlashStatus.warning,
                            );
                          }
                        } else {
                          AlertHelper.showFlashAlert(
                            title: 'Уучлаарай',
                            message: 'Та мэдээллээ бүрэн бөглөнө үү',
                            status: FlashStatus.warning,
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            FaIcon.circlePlus,
                            style: FaIcon.regular().copyWith(color: Colors.white, fontSize: 14),
                          ),
                          const SizedBox(width: 8),
                          Text('Баг үүсгэх'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
        controller.state.isLoading,
      ),
    );
  }
}
