import 'package:get/get.dart';

class CompetitionDetailState {
  final RxString gameCode = RxString('');
  final RxMap gameData = RxMap();
  final RxBool isLoading = RxBool(false);
  bool isValidUserType = false;
}
