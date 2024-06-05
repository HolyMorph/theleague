import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditTeamState {
  final RxString teamCode = RxString('');
  final RxString from = RxString('');
  final RxBool isLoading = RxBool(false);
  final RxBool isSearching = RxBool(false);
  final RxBool isMeOwner = RxBool(false);
  final RxMap myTeam = RxMap();
  final RxList teamMembers = RxList();
  final Rx<XFile?> selectedImage = Rx(null);
  final RxString newTeamName = RxString('');
  final RxString newLogoUrl = RxString('');
  final TextEditingController searchEditingController = TextEditingController();
}
