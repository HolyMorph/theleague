import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../style/my_colors.dart';
import '../../../../utils/fa_icon.dart';
import 'team_member_cart.dart';

class RegisterTeamCart extends StatelessWidget {
  final Map teamData;
  final bool isScrollAble;
  const RegisterTeamCart({required this.teamData, required this.isScrollAble, super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: teamData['team']['logoUrl'],
                  alignment: Alignment.center,
                  imageBuilder: (context, imageProvider) => Container(
                    height: 50,
                    width: 50,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1, color: MyColors.grey300),
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
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${teamData['team']['name']}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Багийн гишүүд: ${teamData['team']['memberCount']}',
                        style: TextStyle(
                          fontSize: 14,
                          color: MyColors.darkGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  FaIcon.edit,
                  style: FaIcon.regular().copyWith(color: MyColors.primaryColor, fontSize: 20),
                ),
              ],
            ).paddingAll(8),
          ),
          ListView.builder(
            physics: isScrollAble ? AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 8),
            itemCount: teamData['members'].length,
            itemBuilder: (context, index) {
              return TeamMemberCart(player: teamData['members'][index]);
            },
          ),
        ],
      ),
    );
  }
}
