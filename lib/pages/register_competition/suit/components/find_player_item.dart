import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../style/my_colors.dart';
import '../../logic/register_competition_controller.dart';

class FindPlayerItem extends GetView<RegisterCompetitionController> {
  final dynamic player;
  final Function(dynamic) selectedPlayer;
  const FindPlayerItem({required this.player, required this.selectedPlayer, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          selectedPlayer(player);
        },
        borderRadius: BorderRadius.circular(8),
        child: ColoredBox(
          color: Colors.transparent,
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: '${player['avatar']}?size=w100',
                imageBuilder: (context, imageProvider) => Container(
                  height: 32,
                  width: 32,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: imageProvider, fit: BoxFit.fitHeight),
                  ),
                ),
                placeholder: (context, url) => Container(
                  alignment: Alignment.center,
                  height: 32,
                  width: 32,
                  child: CupertinoActivityIndicator(animating: true, radius: 10, color: Colors.white),
                ),
                errorWidget: (context, url, error) => Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: MyColors.grey100),
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.person, size: 32),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    player['name'],
                    style: TextStyle(
                      fontSize: 16,
                      color: MyColors.grey900,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        player['sportLabId'],
                        style: TextStyle(
                          fontSize: 12,
                          color: MyColors.grey600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 4),
                      if (!player['isVerified'])
                        Icon(
                          Icons.warning,
                          color: MyColors.redColor,
                          size: 20,
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
