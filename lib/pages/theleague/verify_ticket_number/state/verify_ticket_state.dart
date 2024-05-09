import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class VerifyTicketState {
  final RxBool isLoading = RxBool(false);
  final RxString ticketCode = RxString('');
  final RxBool valid = RxBool(false);
  Position? currentLocation;
}
