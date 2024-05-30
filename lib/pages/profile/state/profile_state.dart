import 'package:get/get.dart';

class ProfileState {
  final RxBool isActive = false.obs;
  final RxBool isLoading = RxBool(false);
  final RxMap meData = RxMap();
}
