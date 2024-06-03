import 'package:get/get.dart';

class AllStarState {
  final RxString gender = RxString('');
  final RxString category = RxString('');
  final RxString gameCode = RxString('');
  final RxBool isCanVote = RxBool(false);
  final RxBool isLoading = RxBool(false);
  final RxBool playerLoading = RxBool(false);
  final RxMap<String, RxList<Map<String, dynamic>>> selectedPlayers = RxMap({
    'MB': RxList<Map<String, dynamic>>(),
    'L': RxList<Map<String, dynamic>>(),
    'S': RxList<Map<String, dynamic>>(),
    'OH': RxList<Map<String, dynamic>>(),
    'OPH': RxList<Map<String, dynamic>>(),
  });

  final RxMap<String, dynamic> coachData = RxMap();
  final RxString selectedTeamCode = RxString('');
  final RxList<dynamic> teamPlayers = RxList();
  final RxList<dynamic> teams = RxList();
  final RxInt totalQty = RxInt(0);
  Map<String, List<String>> preparedList = {};
  String title = '';
}
