import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/my_drop_down.dart';
import '../../../style/my_colors.dart';
import '../../settings/suit/components/settings_textfield.dart';
import '../logic/edit_team_controller.dart';
import '../suit/components/edit_image_picker.dart';
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
                                isActive: true,
                                hintText: 'Багийн нэр',
                                onChanged: (input) {},
                                isRequired: true,
                              ),
                              const SizedBox(height: 16),
                              MyDropDown(
                                title: 'Хүйс',
                                isRequired: true,
                                onChanged: (value) {},
                                selectedAbleList: ['Эрэгтэй', 'Эмэгтэй'],
                              ),
                              const SizedBox(height: 16),
                              MyDropDown(
                                title: 'Спортын төрөл',
                                isRequired: true,
                                onChanged: (value) {},
                                selectedAbleList: [],
                                dictionary: {},
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
                ],
              ),
      ),
    );
  }
}
