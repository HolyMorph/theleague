import 'package:get/get.dart';

import '../state/page2_state.dart';

class Page2Controller extends GetxController {
  final state = Page2State();

  void decreaseCounter() => state.counter -= 1;
  void increaseCounter() => state.counter += 1;
}
