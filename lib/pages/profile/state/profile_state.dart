import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileState {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final RxBool checkerLoading = RxBool(false);
  bool isDone = false;
}
