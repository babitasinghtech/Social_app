import 'package:get/get.dart';
import 'package:social_media/Pages/Auth/Authentication.dart';
import 'package:social_media/Pages/HomePage/HomePage.dart';

var pagePath = [
  GetPage(
    name: "/Authentication",
    page: () => Authentication(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/homePage",
    page: () => HomePage(),
    transition: Transition.rightToLeft,
  ),
];
