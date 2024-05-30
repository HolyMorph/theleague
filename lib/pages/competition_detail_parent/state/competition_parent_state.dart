import 'package:get/get.dart';

class CompetitionParentState {
  final RxString gameCode = RxString('');
  final RxMap gameData = RxMap();
  final RxBool isLoading = RxBool(false);
}
