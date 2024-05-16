import 'package:get/get.dart';

class CoachVerifyState {
  final RxString coachCode = RxString('');
  final RxBool isLoading = RxBool(false);
  final RxString teamCode = RxString('');
  final RxList teams = RxList();
}
