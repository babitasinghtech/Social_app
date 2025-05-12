import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:social_media/Controller/AuthController.dart';
import 'package:social_media/Controller/ProfileController.dart';
import 'package:social_media/Pages/UserProfile/Widgets/profileuserinfo.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    ProfileController profileController = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed("/updateProfilePage");
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ProfileUserInfo(),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                authController.logoutUser();
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
