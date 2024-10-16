import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/empty_view.dart';
import '../../../style/my_colors.dart';
import '../logic/home_controller.dart';
import '../suit/component/home_appbar.dart';
import '../suit/home_competition_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return GetBuilder(
      init: HomeController(),
      builder: (HomeController controller) {
        return Scaffold(
          backgroundColor: MyColors.grey200,
          appBar: AppBar(
            backgroundColor: MyColors.primaryColor,
            automaticallyImplyLeading: false,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight + 30),
              child: HomeAppBar(),
            ),
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              await controller.getHomeData();
            },
            child: Obx(
              () => controller.state.isLoading.value
                  ? Center(child: CircularProgressIndicator(color: MyColors.primaryColor))
                  : controller.state.filteredList.isEmpty
                      ? EmptyView(text: 'Одоогоор тэмцээн байхгүй байна')
                      : ListView.separated(
                          shrinkWrap: true,
                          itemCount: controller.state.filteredList.length,
                          itemBuilder: (context, index) {
                            return HomeCompetitionItem(
                              data: controller.state.filteredList[index],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 8);
                          },
                        ).paddingAll(16),
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
