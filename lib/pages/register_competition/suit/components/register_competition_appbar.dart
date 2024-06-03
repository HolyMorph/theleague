import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../style/my_colors.dart';
import '../../logic/register_competition_controller.dart';

class RegisterCompetitionAppbar extends GetView<RegisterCompetitionController> {
  final String coverUrl;
  const RegisterCompetitionAppbar({required this.coverUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
      (data) => Container(
        height: 250,
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: '${coverUrl}?size=w500',
              imageBuilder: (context, imageProvider) => Container(
                height: 250,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => Container(
                alignment: Alignment.center,
                height: 250,
                child: CupertinoActivityIndicator(animating: true, radius: 10, color: MyColors.primaryColor),
              ),
              errorWidget: (context, url, error) => Container(
                height: 250,
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/ic_logo_bg.png',
                  color: MyColors.primaryColor,
                ),
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.6),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '${data['name']}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Зохион байгуулагч: ${data['organizerName']}',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).viewPadding.top,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.chevron_left,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      controller.state.gameData,
    );
  }
}
