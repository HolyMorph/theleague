import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/logic/home_controller.dart';

class DrawerItem extends GetView<HomeController> {
  final List<Map<String, dynamic>> players;
  final String positionName;
  const DrawerItem({required this.positionName, required this.players, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            controller.getPositionName(position: positionName),
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8),
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: players.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Color(0xFF272739)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl: players[index]['avatarUrl'],
                      imageBuilder: (context, imageProvider) => Container(
                        height: 40,
                        width: 40,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: Color(int.parse('0xFF4c1c1a'))),
                          image: DecorationImage(image: imageProvider, fit: BoxFit.fitHeight),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 8,
                              color: Color(int.parse('0xFF4c1c1a')).withOpacity(0.5),
                            ),
                          ],
                        ),
                      ),
                      placeholder: (context, url) => Center(
                        child: CupertinoActivityIndicator(animating: true, radius: 10, color: Colors.white),
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.image_outlined, color: Colors.grey, size: 60),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${players[index]['firstName']} ${players[index]['lastName']}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${players[index]['jerseyNumber']} - IHC Apes',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      splashColor: Colors.grey,
                      onPressed: () {
                        controller.state.selectedPlayers['${positionName}']?.removeWhere(
                          (element) => element['_id'] == players[index]['_id'],
                        );
                        controller.state.selectedPlayers.refresh();
                        controller.calculateTotalQty();
                      },
                      icon: Icon(Icons.close, color: Colors.white),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 8);
            },
          ),
        ],
      ),
    );
  }
}
