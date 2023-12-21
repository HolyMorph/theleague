import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../../alert/alert_helper.dart';
import '../../alert/flash_status.dart';
import '../../storage/local_storage.dart';
import '../state/verify_ticket_state.dart';

class VerifyTicketController extends GetxController {
  final state = VerifyTicketState();

  void set ticketCode(String ticketCode) => state.ticketCode.value = ticketCode;
  void set valid(bool valid) => state.valid.value = valid;

  Future<void> getCurrentPosition() async {
    final hasPermission = await handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((Position position) {
      state.currentLocation = position;
      LocalStorage.saveData('lat', position.latitude);
      LocalStorage.saveData('lon', position.longitude);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(content: Text('Байршил тогтоогчийн зөвшөөрөл өгснөөр үргэлжлүүлэх боломжтой')));

      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        AlertHelper.showFlashAlert(
          title: 'Алдаа гарлаа',
          message: 'Байршил тогтоогчийн зөвшөөрөл өгснөөр үргэлжлүүлэх боломжтой',
          status: FlashStatus.failed,
        );
        valid = false;

        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      AlertHelper.showFlashAlert(
        title: 'Алдаа гарлаа',
        message: 'Байршил тогтоогчийн зөвшөөрөл өгснөөр үргэлжлүүлэх боломжтой',
        status: FlashStatus.failed,
      );
      valid = false;

      return false;
    }
    valid = true;

    return true;
  }

  @override
  void onInit() {
    handleLocationPermission();

    super.onInit();
  }
}
