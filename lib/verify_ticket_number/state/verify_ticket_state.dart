import 'package:get/get.dart';

class VerifyTicketState {
  final RxBool isLoading = RxBool(false);
  final RxString ticketCode = RxString('');
}
