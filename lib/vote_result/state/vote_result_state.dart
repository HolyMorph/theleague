import 'package:get/get.dart';

class VoteResultState {
  RxList<dynamic> arenaVoteResults = RxList([]);
  RxList<dynamic> coachVoteResults = RxList([]);
  RxString gender = 'male'.obs;
  RxBool isLoading = true.obs;
  RxList<dynamic> onlineVoteResults = RxList([]);
  RxList<dynamic> voteHistories = RxList([]);
}
