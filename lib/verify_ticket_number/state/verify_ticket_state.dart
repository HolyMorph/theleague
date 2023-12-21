import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class VerifyTicketState {
  final RxString ticketCode = RxString('');
  final RxBool valid = RxBool(false);
  Position? currentLocation;
}
