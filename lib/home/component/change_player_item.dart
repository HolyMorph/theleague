import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/home_controller.dart';

class ChangePlayerItem extends GetView<HomeController> {
  final String imageUrl;
  final String teamCode;
  ChangePlayerItem({required this.imageUrl, required this.teamCode, super.key});

  @override
  Widget build(BuildContext context) {
    String teamColor = controller.state.teams.firstWhereOrNull((element) => element['code'] == teamCode)['colorCode'];

    return Container(
      width: 40,
      height: 40,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1, color: Colors.white),
      ),
      child: imageUrl.isEmpty
          ? Icon(Icons.add, color: Colors.white)
          : CachedNetworkImage(
              imageUrl: '${imageUrl}?size=w100',
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff0F0F17),
                      Color(int.parse('0xFF${teamColor.substring(1, teamColor.length)}')),
                    ],
                  ),
                ),
              ),
              placeholder: (context, url) => Container(
                alignment: Alignment.center,
                height: 40,
                width: 40,
                child: CupertinoActivityIndicator(animating: true, radius: 10, color: Colors.white),
              ),
              errorWidget: (context, url, error) => Image.asset('assets/icons/ic_player.png', height: 40, width: 40),
            ),
    );
  }
}
