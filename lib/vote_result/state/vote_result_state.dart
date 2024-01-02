import 'package:get/get.dart';

class VoteResultState {
  RxList<dynamic> arenaVoteResults = RxList();
  RxList<dynamic> coachVoteResults = RxList();
  RxString gender = 'male'.obs;
  RxBool isLoading = true.obs;
  RxBool isMale = true.obs;
  RxList<dynamic> onlineVoteResults = RxList();
  RxList<Map<String, dynamic>> voteHistories = RxList();
}
