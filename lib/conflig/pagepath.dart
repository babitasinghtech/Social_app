import 'package:get/get.dart';
import 'package:social_media/Pages/Auth/Authentication.dart';
import 'package:social_media/Pages/Chat/chatPage.dart';
import 'package:social_media/Pages/HomePage/HomePage.dart';
import 'package:social_media/Pages/Profile/ProfilePages.dart';
import 'package:social_media/Pages/Profile/UpdateProfilePage.dart';

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
  GetPage(
    name: "/SingleChatPage",
    page: () => SingleChatPage(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/ProfilePage",
    page: () => ProfilePage(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/updateProfilePage",
    page: () => UpdateProfilePage(),
    transition: Transition.rightToLeft,
  ),
];
