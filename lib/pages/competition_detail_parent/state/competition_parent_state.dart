import 'package:get/get.dart';

class CompetitionParentState {
  final RxString gameCode = RxString('');
  final RxString gameName = RxString('');
  final RxString coverImage = RxString('');
  final RxMap gameData = RxMap();
  final RxBool isLoading = RxBool(false);
}
