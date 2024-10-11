import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../style/my_colors.dart';

class LeagueAthleteInfo extends StatelessWidget {
  final dynamic userData;
  const LeagueAthleteInfo({required this.userData, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white.withOpacity(0.03),
      ),
      child: Stack(
        children: [
          if (userData['team']?['logoUrl'] != null)
            Positioned(
              top: -32,
              left: Get.size.width * 0.12,
              child: Opacity(
                opacity: 0.2,
                child: CachedNetworkImage(
                  imageUrl: '${userData['team']['logoUrl']}?size=w300',
                  imageBuilder: (context, imageProvider) => Container(
                    height: Get.size.width * 0.4,
                    width: Get.size.width * 0.4,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: imageProvider, fit: BoxFit.contain),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 50,
                    child: CupertinoActivityIndicator(animating: true, radius: 10, color: MyColors.primaryColor),
                  ),
                  errorWidget: (context, url, error) => SizedBox(),
                ),
              ),
            ),
          Container(
            padding: EdgeInsets.fromLTRB(
              Get.size.width * 0.1,
              Get.size.width * 0.08,
              18,
              0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (userData['team']?['logoUrl'] != null)
                      CachedNetworkImage(
                        imageUrl: '${userData['team']['logoUrl']}?size=w300',
                        imageBuilder: (context, imageProvider) => Container(
                          height: 50,
                          width: 50,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: imageProvider, fit: BoxFit.contain),
                          ),
                        ),
                        placeholder: (context, url) => Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          child: CupertinoActivityIndicator(animating: true, radius: 10, color: MyColors.primaryColor),
                        ),
                        errorWidget: (context, url, error) => Container(
                          height: 50,
                          width: 50,
                          child: Icon(
                            Icons.error_outline,
                            size: 50,
                            color: MyColors.primaryColor,
                          ),
                        ),
                      ),
                    if (userData['avatar'] != null)
                      CachedNetworkImage(
                        imageUrl: '${userData['avatar']}?size=w500',
                        imageBuilder: (context, imageProvider) => Container(
                          height: 100,
                          width: 100,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: imageProvider, fit: BoxFit.contain),
                          ),
                        ),
                        placeholder: (context, url) => Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          child: CupertinoActivityIndicator(animating: true, radius: 10, color: MyColors.primaryColor),
                        ),
                        errorWidget: (context, url, error) => Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 1),
                                blurRadius: 8,
                                color: MyColors.grey200,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.person,
                            size: 45,
                            color: MyColors.primaryColor,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 32),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${userData['team']?['abbr'] ?? '-'} | #${userData['jerseyNumber'] ?? '-'} | ${userData['positionGroupCode'] ?? '-'}',
                        style: TextStyle(
                          color: MyColors.primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        userData['lastName'] ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: MyColors.greyBlue800,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        userData['firstName'] ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: MyColors.greyBlue800,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      if (userData['code'] != null)
                        Row(
                          children: [
                            Text(
                              'SportLab ID: ',
                              style: TextStyle(fontSize: 14, color: MyColors.darkGrey),
                            ),
                            Expanded(
                              child: Text(
                                userData['code'] ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 14, color: MyColors.greyBlue800),
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
