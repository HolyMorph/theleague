import 'package:get/get.dart';

import '../state/verify_ticket_state.dart';

class VerifyTicketController extends GetxController {
  final state = VerifyTicketState();

  void set isLoading(bool isLoading) => state.isLoading.value = isLoading;
  void set ticketCode(String ticketCode) => state.ticketCode.value = ticketCode;
}
