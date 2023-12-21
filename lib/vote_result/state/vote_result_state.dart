import 'package:get/get.dart';

class VoteResultState {
  RxList<dynamic> arenaVoteResultsFemale = RxList([]);
  RxList<dynamic> arenaVoteResultsMale = RxList([]);
  RxList<dynamic> coachVoteResultsFemale = RxList([]);
  RxList<dynamic> coachVoteResultsMale = RxList([]);
  RxString gender = 'male'.obs;
  RxBool isLoading = true.obs;
  RxBool isMale = true.obs;
  RxList<dynamic> onlineVoteResultsFemale = RxList([]);
  RxList<dynamic> onlineVoteResultsMale = RxList([]);
  RxList<dynamic> voteHistories = RxList([]);
}
