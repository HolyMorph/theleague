import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../style/my_colors.dart';
import '../../../core/logic/core_controller.dart';

class SearchMemberCart extends StatelessWidget {
  final dynamic player;
  final VoidCallback? onRemove;
  const SearchMemberCart({required this.player, this.onRemove, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 8,
            color: MyColors.grey200,
          ),
        ],
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: '${player['avatar']}?size=w150',
            imageBuilder: (context, imageProvider) => Container(
              height: 50,
              width: 50,
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
              height: 50,
              width: 50,
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
                      '${player['lastName']} ${player['firstName']}',
                      style: TextStyle(
                        fontSize: 16,
                        color: MyColors.grey900,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (player['code'] == Get.find<CoreController>().state.meData['code'])
                      Text(
                        ' (Би)',
                        style: TextStyle(fontSize: 16, color: MyColors.emptyGrey),
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
                    // const SizedBox(width: 4),
                    // if (player['verificationStatus'] == 0)
                    //   Icon(
                    //     Icons.warning,
                    //     color: MyColors.redColor,
                    //     size: 20,
                    //   ),
                  ],
                ),
              ],
            ),
          ),
          if (onRemove != null)
            IconButton(
              onPressed: onRemove,
              icon: Icon(Icons.close, color: MyColors.primaryColor),
            ),
        ],
      ),
    );
  }
}
