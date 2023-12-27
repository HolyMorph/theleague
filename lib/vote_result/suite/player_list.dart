import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../storage/local_storage.dart';
import '../../style/my_colors.dart';
import '../../utils/constants.dart';
import '../logic/vote_result_controller.dart';

class PlayerList extends GetView<VoteResultController> {
  final List<dynamic> leaderboard;
  PlayerList({required this.leaderboard, Key? key}) : super(key: key);

  final RxList<dynamic> teams = RxList();

  @override
  Widget build(BuildContext context) {
    teams.value = LocalStorage.getData(Constants.TEAMS);

    return leaderboard.isNotEmpty
        ? RefreshIndicator(
            color: MyColors.secondaryColor,
            onRefresh: () async {
              await controller.refreshFunction();
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  for (var index = 0; index < leaderboard.length; index++)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 30,
                            child: Text(
                              '${index + 1}.',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'GIP',
                              ),
                            ),
                          ),
                          CachedNetworkImage(
                            imageUrl: '${teams.firstWhereOrNull((element) => element['code'] == leaderboard[index]['teamCode'])['logoUrl']}?size=w60',
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '${leaderboard[index]['lastName'].substring(0, 1)}. ${leaderboard[index]['firstName']}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'GIP',
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '${leaderboard[index]['score']}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'GIP',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/ic_empty.png',
                scale: 3,
                color: Colors.white.withOpacity(0.5),
              ),
              const SizedBox(height: 16),
              Text(
                'Одоогоор санал алга байна',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  fontFamily: 'GIP',
                ),
              ),
            ],
          );
  }
}
