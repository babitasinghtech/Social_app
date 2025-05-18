import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  RxBool isPicking = false.obs;

  Future<String> pickImage() async {
    if (isPicking.value) return ""; // Prevent multiple calls

    try {
      isPicking.value = true;
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      isPicking.value = false;

      if (pickedFile != null) {
        return pickedFile.path;
      } else {
        return "";
      }
    } catch (e) {
      isPicking.value = false;
      print("Error picking image: $e");
      return "";
    }
  }
}
