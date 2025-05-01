import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/Controller/AuthController.dart';
import 'package:social_media/Widget/primarybutton.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    AuthController authController = Get.put(AuthController());
    return Column(
      children: [
        SizedBox(height: 40),
        TextField(
          controller: email,
          decoration: const InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(Icons.alternate_email_rounded),
          ),
        ),
        SizedBox(height: 30),
        TextField(
          controller: password,
          decoration: const InputDecoration(
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
                          authController.login(email.text, password.text);
                          // Get.offAllNamed("/homePage");
                        },
                        btnName: "LOGIN",
                        icon: Icons.lock_open_outlined,
                      ),
                    ],
                  ),
        ),
      ],
    );
  }
}
