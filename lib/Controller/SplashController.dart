import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    splashHandle(); // No await here, handle it properly
  }

  Future<void> splashHandle() async {
    // Correct delay
    await Future.delayed(Duration(milliseconds: 500));

    // Use post-frame callback to safely navigate after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (auth.currentUser == null) {
        Get.offAllNamed("/Authentication");
      } else {
        Get.offAllNamed("/homePage");
      }
    });

    print("hello");
  }
}
