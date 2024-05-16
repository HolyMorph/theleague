import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VoteResultState {
  final RxInt tabIndex = RxInt(0);
  final RxInt tabLength = RxInt(0);
  final RxList<dynamic> players = RxList();
  final RxList<dynamic> teams = RxList();
  RxList<dynamic> arenaVoteResults = RxList();
  RxList<dynamic> coachVoteResults = RxList();
  RxString gender = 'male'.obs;
  RxBool initLoading = true.obs;
  RxBool isLoading = true.obs;
  RxBool isMale = true.obs;
  RxList<dynamic> onlineVoteResults = RxList();
  late TabController tabController;
  RxList<dynamic> totalVoteResults = RxList();
  RxList<Map<String, dynamic>> voteHistories = RxList();
}
