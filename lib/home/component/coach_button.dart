import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../storage/local_storage.dart';
import '../logic/home_controller.dart';

class CoachButton extends GetView<HomeController> {
  const CoachButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(
          int.parse(
            '0xFF${LocalStorage.getData('coachData')['teamColor'].substring(1, LocalStorage.getData('coachData')['teamColor'].length)}',
          ),
        ),
        disabledBackgroundColor: Color(
          int.parse(
            '0xFF${LocalStorage.getData('coachData')['teamColor'].substring(1, LocalStorage.getData('coachData')['teamColor'].length)}',
          ),
        ).withOpacity(0.4),
      ),
      onPressed: controller.state.totalQty.value > 0 ? () async => () {} : null,
      child: Text(
        'Саналаа өгөх',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'GIP'),
      ),
    );
  }
}
