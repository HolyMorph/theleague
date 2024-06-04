import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../style/my_colors.dart';

class CompetitionHeader extends StatelessWidget {
  final String coverUrl;
  const CompetitionHeader({required this.coverUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: '${coverUrl}?size=w600',
          fit: BoxFit.contain,
          placeholder: (context, url) => Container(
            alignment: Alignment.center,
            height: 250,
            width: double.infinity,
            child: CupertinoActivityIndicator(animating: true, radius: 10, color: MyColors.primaryColor),
          ),
          errorWidget: (context, url, error) => Container(
            height: 250,
            width: double.infinity,
            child: Image.asset(
              'assets/images/ic_logo_bg.png',
              color: MyColors.primaryColor,
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 32,
          left: 8,
          child: IconButton(
            icon: Icon(Icons.chevron_left, color: Colors.white, size: 36),
            onPressed: () => Get.back(),
          ),
        ),
      ],
    );
  }
}
