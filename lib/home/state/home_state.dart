import 'package:get/get.dart';

class HomeState {
  final RxString gender = RxString('');
  final RxBool isCanVote = RxBool(false);
  final RxBool isLoading = RxBool(false);
  final RxBool playerLoading = RxBool(false);
  final RxMap<String, RxList<Map<String, dynamic>>> selectedPlayers = RxMap({
    'F': RxList<Map<String, dynamic>>(),
    'G': RxList<Map<String, dynamic>>(),
    'PG': RxList<Map<String, dynamic>>(),
    'C': RxList<Map<String, dynamic>>(),
  });

  final RxString selectedTeamCode = RxString('');
  final RxList<dynamic> teamPlayers = RxList();
  final RxList<dynamic> teams = RxList();
  final RxInt totalQty = RxInt(0);
  final RxString type = RxString('');
  Map<String, List<String>> preparedList = {};
  String title = '';
}
