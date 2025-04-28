import 'package:flutter/material.dart';
import 'package:social_media/Pages/Welcome/Widget/Welcomebody.dart';
import 'package:social_media/Pages/Welcome/Widget/Welcomefooterbutton.dart';
import 'package:social_media/Pages/Welcome/Widget/Welcomeheading.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [WelcomeHeading(), Welcomebody(), WelcomeFooterButton()],
          ),
        ),
      ),
    );
  }
}
