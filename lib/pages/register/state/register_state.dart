import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterState {
  final RxBool isLoading = RxBool(false);
  final RxBool passwordValid = RxBool(false);
  final RxInt selectedIndex = RxInt(0);
  final RxString selectedGender = RxString('Эрэгтэй');
  final RxString from = RxString('');
  final Rx<XFile?> selectedImage = Rx(null);
  final RxString avatarUrl = RxString('');
  final PageController pageController = PageController();
  final RxString registerType = RxString('');
  final TextEditingController clientNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController registerController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
}
