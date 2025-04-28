import 'package:get/get.dart';
import 'package:social_media/Pages/Auth/Authentication.dart';

var pagePath = [
  GetPage(
    name: "/Authentication",
    page: () => Authentication(),
    transition: Transition.rightToLeft,
  ),
];
