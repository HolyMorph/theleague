import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../../../../alert/alert_helper.dart';
import '../../../../alert/flash_status.dart';
import '../../../../route/my_routes.dart';
import '../../../../service/method.dart';
import '../../../../service/my_client.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/my_storage.dart';
import '../../../onboarding/component/location_dialog.dart';
import '../state/verify_ticket_state.dart';

class VerifyTicketController extends GetxController {
  final state = VerifyTicketState();
  void set isLoading(bool isLoading) => state.isLoading.value = isLoading;
  void set ticketCode(String ticketCode) => state.ticketCode.value = ticketCode;
  void set valid(bool valid) => state.valid.value = valid;

  Future<void> checkTicket() async {
    var body = {'game_code': state.ticketCode.value};

    var (isSuccess, response) = await MyClient().sendHttpRequest(urlPath: '/api/me/check-game-code', method: Method.post, body: body);

    if (isSuccess) {
      if (response.data['statusCode'] == 400) {
        var message = response.data['message_mn'] ?? response.data['message'] as String;

        AlertHelper.showFlashAlert(
          title: 'Алдаа гарлаа',
          message: message,
          status: FlashStatus.failed,
        );
      } else {
        Get.offNamed('${MyRoutes.selectLeague}/arena');
        MyStorage().saveData(Constants.TicketCode, state.ticketCode.value);
      }
    } else {
      var message = response.data['message'] ?? response.data['error']['message_mn'] as String;

      AlertHelper.showFlashAlert(
        title: 'Алдаа гарлаа',
        message: message,
        status: FlashStatus.failed,
      );
    }
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((Position position) {
      state.currentLocation = position;
      MyStorage().saveData('lat', position.latitude);
      MyStorage().saveData('lon', position.longitude);
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
      showLocationDialog();

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
        showLocationDialog();

        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      AlertHelper.showFlashAlert(
        title: 'Алдаа гарлаа',
        message: 'Байршил тогтоогчийн зөвшөөрөл өгснөөр үргэлжлүүлэх боломжтой',
        status: FlashStatus.failed,
      );
      showLocationDialog();

      return false;
    }

    return true;
  }

  @override
  void onInit() {
    handleLocationPermission();

    super.onInit();
  }

  void showLocationDialog() {
    Get.dialog(
      AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        content: LocationDialog(),
      ),
      barrierDismissible: false,
    );
  }
}
