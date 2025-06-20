import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:social_media/model/Usermodel.dart';

class ProfileController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final store = FirebaseStorage.instance;
  RxBool isLoading = false.obs;

  Rx<UserModel> currentUser = UserModel().obs;

  UserModel get userModel => currentUser.value; // ✅ This line fixes your error

  @override
  void onInit() async {
    super.onInit();
    await getUserDetails();
  }

  Future<void> getUserDetails() async {
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .get()
        .then(
          (value) => {currentUser.value = UserModel.fromJson(value.data()!)},
        );
  }

  // ignore: non_constant_identifier_names
  Future<void> UpdateProfile(
    String imageUrl,
    String name,
    String about,
    String number,
  ) async {
    isLoading.value = true;
    try {
      if (imageUrl != "") {
        final imageLink = await uplaodFileToFirebase(imageUrl);

        final updatedUser = UserModel(
          id: auth.currentUser!.uid,
          email: auth.currentUser!.email,
          name: name,
          about: about,
          profileImage:
              imageUrl == "" ? currentUser.value.profileImage : imageLink,
          phoneNumber: number,
        );
        await db
            .collection("users")
            .doc(auth.currentUser!.uid)
            .set(updatedUser.toJson());
      }

      await getUserDetails();
    } catch (ex) {
      // ignore: avoid_print
      print(ex);
    }
    isLoading.value = false;
  }

  Future<String> uplaodFileToFirebase(String imagePath) async {
    // ignore: unnecessary_brace_in_string_interps
    final path = "files/${imagePath}";
    final file = File(imagePath);
    if (imagePath != "") {
      try {
        final ref = store.ref().child(path).putFile(file);
        final uploadTask = await ref.whenComplete(() {});
        final downloadImageUrl = await uploadTask.ref.getDownloadURL();
        print(downloadImageUrl);
        return downloadImageUrl;
      } catch (ex) {
        print(ex);
        return "";
      }
    }
    return "";
  }
}
