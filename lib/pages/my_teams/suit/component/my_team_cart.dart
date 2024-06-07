import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../style/my_colors.dart';
import '../../../../utils/fa_icon.dart';
import '../../../edit_team/suit/edit_team_routes.dart';
import '../../logic/my_teams_controller.dart';

class MyTeamCart extends GetView<MyTeamsController> {
  final dynamic team;
  const MyTeamCart({required this.team, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(EditTeamRoutes.editTeamScreen + '/${team['code']}');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: MyColors.grey200,
              blurRadius: 8,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: '${team['logoUrl']}?size=w150',
              imageBuilder: (context, imageProvider) => Container(
                height: 50,
                width: 50,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
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
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${team['name']}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '${controller.state.myTeams['meta']['sportCategoryDictionary']['${team['sportCategory']}']}',
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
              style: FaIcon.regular().copyWith(color: MyColors.primaryColor, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
