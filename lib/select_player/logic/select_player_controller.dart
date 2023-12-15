import 'package:get/get.dart';
import '../state/select_player_state.dart';

class SelectPlayerController extends GetxController {
  final state = SelectPlayerState();
  void set title(String title) => state.title = title;

  String getTitle() {
    switch (state.title) {
      case 'guard':
        {
          return 'Хамгаалагч сонгох';
        }
      case 'forward':
        {
          return 'Довтлогч сонгох';
        }
      case 'center':
        {
          return 'Төвийн тоглогч сонгох';
        }
      case 'pointGuard':
        {
          return 'Холбогч сонгох';
        }
      default:
        return '';
    }
  }

  @override
  void onInit() {
    title = Get.parameters['position'] ?? '';
    super.onInit();
  }
}
