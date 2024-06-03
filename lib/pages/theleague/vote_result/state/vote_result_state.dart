import 'package:get/get.dart';

class VoteResultState {
  final RxList<dynamic> players = RxList();
  final RxList<dynamic> teams = RxList();
  final RxString gender = RxString('');
  final RxString category = RxString('');
  final RxString gameCode = RxString('');
  RxBool initLoading = true.obs;
  RxBool isLoading = true.obs;
  RxBool isMale = true.obs;
  RxList<dynamic> onlineVoteResults = RxList();
  RxList<Map<String, dynamic>> voteHistories = RxList();
}
