// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:social_media/Controller/SplashController.dart';
import 'package:social_media/config/images.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  void initState() {
    super.initState();
    // Safe location for initializing controller
    Get.put(SplashController());
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    SplashController splashController = Get.put(SplashController());
    return Scaffold(
      body: Center(child: SvgPicture.asset(AssetsImage.appIconSVG)),
    );
  }
}
