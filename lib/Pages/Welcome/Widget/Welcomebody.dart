import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_media/conflig/String.dart';

class Welcomebody extends StatelessWidget {
  const Welcomebody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("Assets/images/Group 43.png"),
            SvgPicture.asset("Assets/Icons/raphael_connect.svg"),
            Image.asset("Assets/images/Group 44.png"),
          ],
        ),
        SizedBox(height: 30),
        Text(
          WelcomePageString.nowYouAre,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          WelcomePageString.connected,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(height: 20),
        Text(
          WelcomePageString.discription,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}
