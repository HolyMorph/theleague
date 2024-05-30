import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../style/my_colors.dart';
import '../../competition_detail/suit/competition_detail_routes.dart';
import '../../competition_detail_parent/suit/competition_parent_routes.dart';

class HomeCompetitionItem extends StatelessWidget {
  final dynamic data;
  const HomeCompetitionItem({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          Get.toNamed(
            data['hasChildren']
                ? CompetitionParentRoutes.competitionParentScreen + '/${data['code']}'
                : CompetitionDetailRoutes.competitionDetailScreen + '/${data['id']}',
          );
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: '${data['logo_square']}?size=w100',
                imageBuilder: (context, imageProvider) => Container(
                  height: 90,
                  width: 90,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) => Container(
                  alignment: Alignment.center,
                  height: 90,
                  width: 90,
                  child: CupertinoActivityIndicator(animating: true, radius: 10, color: MyColors.primaryColor),
                ),
                errorWidget: (context, url, error) => Container(
                  height: 90,
                  width: 90,
                  child: Image.asset(
                    'assets/images/ic_logo_bg.png',
                    color: MyColors.primaryColor,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${data['name']}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 20,
                          color: MyColors.grey500,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            '${data['address']['name']}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12, color: MyColors.grey500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.calendar_today_sharp,
                          size: 20,
                          color: MyColors.grey500,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${DateFormat('MM сарын dd').format(DateTime.parse('${data['startDate']}'))} - ${DateFormat('MM сарын dd').format(DateTime.parse('${data['endDate']}'))}',
                          style: TextStyle(fontSize: 12, color: MyColors.grey500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
