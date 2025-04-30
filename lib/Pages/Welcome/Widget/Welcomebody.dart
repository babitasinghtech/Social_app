import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_media/conflig/String.dart';
import 'package:social_media/conflig/images.dart';

class Welcomebody extends StatelessWidget {
  const Welcomebody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsImage.boypic, width: 100),
            SvgPicture.asset(AssetsImage.connectSVG, width: 50),
            Image.asset(AssetsImage.girlpic, width: 100),
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
