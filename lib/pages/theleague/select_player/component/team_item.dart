import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../style/my_colors.dart';
import '../../all_star_home/logic/all_star_controller.dart';

class TeamItem extends GetView<AllStarController> {
  final String iconUrl;
  final Function(String) onTap;
  final RxInt selectedPlayer;
  final String teamCode;
  final String teamColor;

  const TeamItem({
    required this.onTap,
    required this.iconUrl,
    required this.teamColor,
    required this.teamCode,
    required this.selectedPlayer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () {
              controller.selectedTeamCode = teamCode;
              onTap(teamCode);
            },
            child: Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF3b3d4f),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 1,
                  color: controller.state.selectedTeamCode.value == teamCode
                      ? Color(int.parse('0xFF${teamColor.substring(1, teamColor.length)}'))
                      : Color(0xFF3B3D4F),
                ),
                boxShadow: [
                  controller.state.selectedTeamCode.value == teamCode
                      ? BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 8,
                          color: Color(int.parse('0xFF${teamColor.substring(1, teamColor.length)}')),
                        )
                      : BoxShadow(),
                ],
              ),
              child: CachedNetworkImage(
                imageUrl: '${iconUrl}?size=w120',
                alignment: Alignment.center,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: imageProvider, fit: BoxFit.contain),
                  ),
                ),
                placeholder: (context, url) => Center(
                  child: CupertinoActivityIndicator(animating: true, radius: 10, color: Colors.white),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.image_outlined, color: Colors.grey, size: 40),
              ),
            ),
          ),
          controller.getTeamPlayersQty(teamCode: teamCode) <= 0
              ? const SizedBox()
              : Positioned(
                  top: -5,
                  right: 10,
                  child: Container(
                    width: 14,
                    height: 14,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: MyColors.redColor),
                    child: Text(
                      '${controller.getTeamPlayersQty(teamCode: teamCode)}',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10, color: Colors.white, fontFamily: 'GIP'),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
