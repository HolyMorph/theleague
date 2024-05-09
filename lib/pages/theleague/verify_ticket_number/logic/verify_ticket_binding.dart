import 'package:get/get.dart';

import 'verify_ticket_controller.dart';

class VerifyTicketBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyTicketController>(() => VerifyTicketController());
  }
}
