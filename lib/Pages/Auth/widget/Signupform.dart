import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:social_media/Controller/AuthController.dart';
import 'package:social_media/Widget/primarybutton.dart';

class Signupform extends StatelessWidget {
  const Signupform({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return Column(
      children: [
        SizedBox(height: 40),
        TextField(
          controller: name,
          decoration: InputDecoration(
            hintText: "Full Name",
            prefixIcon: Icon(Icons.person),
          ),
        ),
        SizedBox(height: 30),
        TextField(
          controller: email,
          decoration: InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(Icons.alternate_email_rounded),
          ),
        ),
        SizedBox(height: 30),
        TextField(
          controller: password,
          decoration: InputDecoration(
            hintText: "Password",
            prefixIcon: Icon(Icons.password_outlined),
          ),
        ),
        SizedBox(height: 40),
        Obx(
          () =>
              authController.isLoading.value
                  ? CircularProgressIndicator()
                  : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PrimaryButton(
                        ontap: () {
                          authController.createUser(email.text, password.text);
                        },
                        btnName: "SIGNUP",
                        icon: Icons.lock_open_outlined,
                      ),
                    ],
                  ),
        ),
      ],
    );
  }
}
