import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateTeamState {
  final Rx<XFile?> selectedImage = Rx(null);
  final RxMap sportTypes = RxMap();
  final RxString selectedGender = RxString('');
  final RxString selectedType = RxString('');
  final RxString teamName = RxString('');
  final RxString logoUrl = RxString('');
  final RxList teamMembers = RxList();
  final TextEditingController textEditingController = TextEditingController();
  final RxBool isSearching = RxBool(false);
  final RxBool isLoading = RxBool(false);
  final RxString from = RxString('');
}
