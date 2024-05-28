import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterState {
  final RxInt selectedIndex = RxInt(0);
  final RxString selectedGender = RxString('Эрэгтэй');
  final Rx<XFile?> selectedImage = Rx(null);
}
