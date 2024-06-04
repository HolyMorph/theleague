import 'package:get/get.dart';

class CompetitionDetailState {
  final RxString gameCode = RxString('');
  final RxMap gameData = RxMap();
  final RxBool isLoading = RxBool(false);
  final RxBool isRegistered = RxBool(false);
  final RxBool isMeJudge = RxBool(false);
  final RxList mandates = RxList();
}
