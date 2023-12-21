import 'package:get/get.dart';

class SelectPlayerState {
  final RxList<Map<String, dynamic>> selectedPlayers = RxList();
  final RxString selectedTeamCode = RxString('');
  final RxList<dynamic> teamPlayers = RxList();
  List<dynamic> teams = [];
  String title = '';
}
