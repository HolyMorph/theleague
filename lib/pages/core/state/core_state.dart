import 'package:get/get.dart';
import '../suit/core_type.dart';

class CoreState {
  final Rx<CoreType> coreType = CoreType.splash.obs;
  final RxMap meData = RxMap();
  final RxBool isActive = RxBool(false);
}
