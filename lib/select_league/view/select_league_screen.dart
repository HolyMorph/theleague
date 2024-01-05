import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/app_back_button.dart';
import '../../route/my_routes.dart';
import '../../storage/local_storage.dart';
import '../../style/my_colors.dart';
import '../../utils/constants.dart';
import '../component/select_league_item.dart';
import '../logic/select_league_controller.dart';

class SelectLeagueScreen extends GetView<SelectLeagueController> {
  const SelectLeagueScreen({super.key});

  @override
  StatelessElement createElement() {
    if (LocalStorage.getData(Constants.PlayersMale).runtimeType != RxMap<String, RxList<Map<String, dynamic>>>) {
      LocalStorage.saveData(Constants.PlayersMale, null);
    }
    if (LocalStorage.getData(Constants.PlayersFemale).runtimeType != RxMap<String, RxList<Map<String, dynamic>>>) {
      LocalStorage.saveData(Constants.PlayersFemale, null);
    }

    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Лиг сонгох'),
        leading: AppBackButton(),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.white.withOpacity(0.1), height: 1.0),
        ),
      ),
      body: ObxValue(
        (_) => controller.state.isLoading.value
            ? Center(child: CircularProgressIndicator(color: MyColors.secondaryColor))
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      'Бүх оддын санал өгөх лигээ сонгоно уу.',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: 'GIP',
                      ),
                    ),
                    const SizedBox(height: 24),
                    SelectLeagueItem(
                      text: 'Эрэгтэй Дээд Лиг',
                      imagePath: 'assets/images/ic_male.png',
                      onTap: () async {
                        controller.gender = 'male';
                        await controller.checkVote();
                        Get.toNamed(
                          '${MyRoutes.homeScreen}/male/${controller.state.isCanVote.value}/${controller.state.type.value}',
                          arguments: controller.state.isCanVote.value ? null : controller.state.result,
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    SelectLeagueItem(
                      text: 'Эмэгтэй Дээд Лиг',
                      imagePath: 'assets/images/ic_female.png',
                      onTap: () async {
                        controller.gender = 'female';
                        await controller.checkVote();
                        Get.toNamed(
                          '${MyRoutes.homeScreen}/female/${controller.state.isCanVote.value}/${controller.state.type.value}',
                          arguments: controller.state.isCanVote.value ? null : controller.state.result,
                        );
                      },
                    ),
                    const Spacer(),
                    Image.asset('assets/icons/ic_logo.png', width: 60, height: 60),
                    const SizedBox(height: 4),
                    Text(
                      '@TheLeague 2024',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.3),
                        fontFamily: 'GIP',
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
        controller.state.isLoading,
      ),
    );
  }
}
