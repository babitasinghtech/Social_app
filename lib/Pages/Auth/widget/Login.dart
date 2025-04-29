import 'package:flutter/material.dart';
import 'package:social_media/Widget/primarybutton.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 40),
        TextField(
          decoration: InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(Icons.alternate_email_rounded),
          ),
        ),
        SizedBox(height: 30),
        TextField(
          decoration: InputDecoration(
            hintText: "Password",
            prefixIcon: Icon(Icons.password_outlined),
          ),
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(btnName: "LOGIN", icon: Icons.lock_open_outlined),
          ],
        ),
      ],
    );
  }
}
