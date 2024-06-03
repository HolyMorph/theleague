import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../style/my_colors.dart';
import '../../../core/logic/core_controller.dart';

class TeamMemberCart extends StatelessWidget {
  final dynamic player;
  const TeamMemberCart({required this.player, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: MyColors.grey200,
            offset: const Offset(0, 1),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: '${player['avatar']}?size=w150',
            imageBuilder: (context, imageProvider) => Container(
              height: 32,
              width: 32,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: MyColors.grey200,
                    blurRadius: 8,
                    offset: const Offset(0, 1),
                  ),
                ],
                image: DecorationImage(image: imageProvider, fit: BoxFit.fitHeight),
              ),
            ),
            placeholder: (context, url) => Container(
              alignment: Alignment.center,
              height: 32,
              width: 32,
              child: CupertinoActivityIndicator(animating: true, radius: 10, color: MyColors.primaryColor),
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${player['name']}',
                      style: TextStyle(
                        fontSize: 16,
                        color: MyColors.grey900,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (player['code'] == Get.find<CoreController>().state.meData['code'])
                      Text(
                        ' (Би)',
                        style: TextStyle(
                          fontSize: 16,
                          color: MyColors.darkGrey,
                        ),
                      ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      player['code'],
                      style: TextStyle(
                        fontSize: 12,
                        color: MyColors.grey600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
