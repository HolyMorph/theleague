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
            height: 150,
            width: double.infinity,
            child: CupertinoActivityIndicator(animating: true, radius: 10, color: MyColors.primaryColor),
          ),
          errorWidget: (context, url, error) => Container(
            height: 150,
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
          top: MediaQuery.of(context).viewPadding.top,
          left: 16,
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: () => Get.back(),
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.transparent,
                ),
                child: Icon(Icons.chevron_left, size: 30, color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
