import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../style/my_colors.dart';
import 'find_player_item.dart';

class TeamInfo extends StatelessWidget {
  const TeamInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Багийн мэдээлэл',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: MyColors.grey700,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  offset: Offset(0, 1),
                  color: MyColors.grey200,
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  child: CachedNetworkImage(
                    imageUrl: '',
                    alignment: Alignment.center,
                    imageBuilder: (context, imageProvider) => Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 50,
                      child: CupertinoActivityIndicator(animating: true, radius: 10, color: MyColors.primaryColor),
                    ),
                    errorWidget: (context, url, error) => Icon(
                      Icons.error_outline,
                      size: 30,
                      color: MyColors.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kanshifu',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Багийн гишүүд: 4',
                      style: TextStyle(
                        fontSize: 14,
                        color: MyColors.darkGrey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Icon(
                  Icons.edit,
                  color: MyColors.greyBlue800,
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
          const SizedBox(height: 16),
          FindPlayerItem(
            player: {
              'name': 'Сэнгэл Зэвэрсэнбаатар',
              'sportLabId': 'ABC091723',
              'image': 'image',
              'isVerified': false,
            },
            selectedPlayer: (player) {},
          ),
        ],
      ),
    );
  }
}
