import 'package:flutter/material.dart';
import 'package:social_media/Pages/Auth/widget/Authenticationbody.dart';
import 'package:social_media/Pages/Welcome/Widget/Welcomeheading.dart';

class Authentication extends StatelessWidget {
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              WelcomeHeading(),
              SizedBox(height: 40),
              AuthenticationPageBody(),
            ],
          ),
        ),
      ),
    );
  }
}
