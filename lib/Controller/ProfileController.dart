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

  Future<void> UpdateProfile(
    String? imageUrl,
    String? name,
    String? about,
    String? number,
  ) async {
    isLoading.value = true;

    final path = "files/${imageUrl}";
    final file = File(imageUrl!);
    try {
      final ref = store.ref().child(path).putFile(file);
    } catch (ex) {
      print(ex);
    }
  }
}
