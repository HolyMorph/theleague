import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayerList extends StatelessWidget {
  final List<dynamic> leaderboard;
  const PlayerList({required this.leaderboard, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: Get.mediaQuery.size.height * 0.3,
        minHeight: Get.mediaQuery.size.height * 0.2,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: leaderboard.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
                children: [
                  for (var index = 0; index < leaderboard.length; index++)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                                child: Text(
                                  '${index + 1}.',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6.5),
                              CachedNetworkImage(
                                imageUrl: leaderboard[index]['avatarUrl'],
                                height: 20,
                                width: 20,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                leaderboard[index]['firstName'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '${leaderboard[index]['score']}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            )
          : SizedBox(
              height: Get.mediaQuery.size.height * 0.2,
              child: Center(
                child: Text(
                  'Одоогоор санал алга байна',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    fontFamily: 'GIP',
                  ),
                ),
              ),
            ),
    );
  }
}
