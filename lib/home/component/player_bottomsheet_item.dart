import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../route/my_routes.dart';
import '../../storage/local_storage.dart';
import '../../utils/constants.dart';
import '../logic/home_controller.dart';

class PlayerBottomSheetItem extends GetView<HomeController> {
  final RxList<Map<String, dynamic>> players;
  final String position;
  const PlayerBottomSheetItem({required this.position, required this.players, super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.only(bottom: 8),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: players.length,
            itemBuilder: (context, index) {
              String teamColor = controller.state.teams.firstWhere((element) => element['code'] == players[index]['teamCode'])['colorCode'];

              return Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Color(0xFF272739)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl: players[index]['avatarUrl'],
                      imageBuilder: (context, imageProvider) => Container(
                        height: 40,
                        width: 40,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: Color(int.parse('0xFF${teamColor.substring(1, teamColor.length)}'))),
                          image: DecorationImage(image: imageProvider, fit: BoxFit.fitHeight),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 8,
                              color: Color(int.parse('0xFF${teamColor.substring(1, teamColor.length)}')).withOpacity(0.5),
                            ),
                          ],
                        ),
                      ),
                      placeholder: (context, url) => Center(
                        child: CupertinoActivityIndicator(animating: true, radius: 10, color: Colors.white),
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.image_outlined, color: Colors.grey, size: 60),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${players[index]['firstName']} ${players[index]['lastName']}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontFamily: 'GIP',
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${players[index]['jerseyNumber']} - ${controller.state.teams.firstWhere((element) => element['code'] == players[index]['teamCode'])['name']}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontFamily: 'GIP',
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      splashColor: Colors.grey,
                      onPressed: () {
                        controller.state.selectedPlayers['${position}']?.removeWhere(
                          (element) => element['_id'] == players[index]['_id'],
                        );
                        controller.state.selectedPlayers.refresh();
                        controller.calculateTotalQty();
                        LocalStorage.saveData(
                          controller.state.gender == 'male' ? Constants.PlayersMale : Constants.PlayersFemale,
                          controller.state.selectedPlayers,
                        );
                      },
                      icon: Icon(Icons.close, color: Colors.white),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 8);
            },
          ),
          ListView.separated(
            itemCount: players.length < 3 ? 1 : 0,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Material(
                color: Color(0xFF272739),
                borderRadius: BorderRadius.circular(5),
                child: InkWell(
                  onTap: () {
                    Get.back();
                    controller.title = position;
                    Get.toNamed('${MyRoutes.selectPlayer}');
                  },
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.transparent),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_circle_outline_rounded, color: Colors.white),
                        const SizedBox(width: 10),
                        Text(
                          'Тоглогч сонгох',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontFamily: 'GIP',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 8);
            },
          ),
        ],
      ),
    );
  }
}
