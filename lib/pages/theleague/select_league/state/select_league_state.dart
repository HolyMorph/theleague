import 'package:get/get.dart';

class SelectLeagueState {
  final RxString gender = RxString('');
  final RxBool isCanVote = RxBool(false);
  final RxBool isLoading = RxBool(false);
  final RxString type = RxString('');
  final RxList players = RxList();
  dynamic result = {
    "PG": RxList<Map<String, dynamic>>([]),
    "F": RxList<Map<String, dynamic>>([]),
    "G": RxList<Map<String, dynamic>>([]),
    "C": RxList<Map<String, dynamic>>([]),
  };
}
