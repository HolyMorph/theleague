import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/logic/home_controller.dart';
import '../../style/my_colors.dart';

class PlayerItem extends GetView<HomeController> {
  final RxBool isSelected;
  final Function(Map<String, dynamic>) onTap;
  final Map<String, dynamic> player;
  final String teamColor;

  PlayerItem({required this.player, required this.onTap, required this.teamColor, required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isSelected.value = controller.state.selectedPlayers['${controller.state.title}']!.length < 3
            ? isSelected.value
                ? false
                : true
            : false;

        onTap(player);
      },
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          ObxValue(
            (_) => Column(
              children: [
                const SizedBox(height: 36),
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border:
                        isSelected.value ? Border.all(width: 2, color: Color(int.parse('0xFF${teamColor.substring(1, teamColor.length)}'))) : null,
                    color: Color(0xFF3B3C4E),
                    boxShadow: [
                      isSelected.value
                          ? BoxShadow(offset: Offset(0, 1), blurRadius: 8, color: Color(int.parse('0xFF${teamColor.substring(1, teamColor.length)}')))
                          : BoxShadow(),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                          gradient: RadialGradient(
                            focal: Alignment.bottomCenter,
                            radius: 1.35,
                            colors: [Color(int.parse('0xFF${teamColor.substring(1, teamColor.length)}')), MyColors.primaryColor],
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          player['jerseyNumber'],
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontFamily: 'GIP',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                        child: Column(
                          children: [
                            Text(
                              player['firstName'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white, fontFamily: 'GIP'),
                            ),
                            Text(
                              player['lastName'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white, fontFamily: 'GIP'),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              controller.getPositionName(position: player['positionCodes'][0]),
                              // getPositionList(list: player['positionCodes']),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'GIP',
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected.value ? Color(0xFF4D5163).withOpacity(0.4) : Color(0xFF4D5163),
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
                        ),
                        child: Text(
                          isSelected.value ? 'Болих' : 'Сонгох',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white, fontFamily: 'GIP'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            isSelected,
          ),
          Column(
            children: [
              CachedNetworkImage(
                imageUrl: player['avatarUrl'],
                alignment: Alignment.center,
                imageBuilder: (context, imageProvider) => Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) => Center(
                  child: CupertinoActivityIndicator(animating: true, radius: 10, color: Colors.white),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.image_outlined, color: Colors.grey, size: 60),
              ),
              Divider(height: 1, thickness: 2, color: Color(int.parse('0xFF${teamColor.substring(1, teamColor.length)}'))),
            ],
          ),
        ],
      ),
    );
  }

  String getPositionList({required List list}) {
    String positions = '';
    for (var position in list) {
      positions += '${controller.getPositionName(position: position)}';
    }

    return positions;
  }
}
