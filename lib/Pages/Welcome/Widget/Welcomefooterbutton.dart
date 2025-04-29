import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
// ignore: unnecessary_import
import 'package:get/get_core/src/get_main.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:social_media/conflig/String.dart';

class WelcomeFooterButton extends StatelessWidget {
  const WelcomeFooterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SlideAction(
          // ignore: body_might_complete_normally_nullable
          onSubmit: () {
            Get.offAllNamed("/Authentication");
          },
          // ignore: sized_box_for_whitespace
          sliderButtonIcon: Container(
            width: 25,
            height: 25,
            child: SvgPicture.asset(
              "Assets/Icons/fa-solid_plug.svg",
              width: 25,
            ),
          ),
          text: WelcomePageString.slideTOStart,
          textStyle: Theme.of(context).textTheme.labelLarge,

          submittedIcon: SvgPicture.asset(
            "Assets/Icons/raphael_connect.svg",
            width: 25,
          ),
          innerColor: Theme.of(context).colorScheme.primary,
          outerColor: Theme.of(context).colorScheme.primaryContainer,
        ),
      ],
    );
  }
}
