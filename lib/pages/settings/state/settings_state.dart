import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SettingsState {
  final RxMap userData = RxMap();
  final Rx<XFile?> selectedImage = Rx(null);
  final RxString avatarUrl = RxString('');
  final RxBool isLoading = RxBool(false);
  final RxBool isAvatarLoading = RxBool(false);
  final RxString weight = RxString('');
  final RxString height = RxString('');
}
