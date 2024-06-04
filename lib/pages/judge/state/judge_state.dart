import 'package:get/get.dart';

class JudgeState {
  final RxMap gameData = RxMap();
  final RxMap entryData = RxMap();
  final RxString gameCode = RxString('');
  final RxBool isLoading = RxBool(false);
  final RxBool isChecked = RxBool(false);
}
