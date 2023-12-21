import 'package:get/get.dart';

class HomeState {
  final RxString gender = RxString('');
  final RxBool playerLoading = RxBool(false);
  final RxMap<String, RxList<Map<String, dynamic>>> selectedPlayers = RxMap({
    'F': RxList(),
    'G': RxList(),
    'PG': RxList(),
    'C': RxList(),
  });

  final RxString selectedTeamCode = RxString('');
  final RxList<dynamic> teamPlayers = RxList();
  final RxList<dynamic> teams = RxList();
  final RxInt totalQty = RxInt(0);
  String title = '';
}
