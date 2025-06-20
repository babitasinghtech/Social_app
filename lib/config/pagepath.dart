import 'package:get/get.dart';
import 'package:social_media/Pages/Auth/Authentication.dart';
import 'package:social_media/Pages/Chat/chatPage.dart';
import 'package:social_media/Pages/ContactPage/ContactPage.dart';
import 'package:social_media/Pages/HomePage/HomePage.dart';
import 'package:social_media/Pages/ProfilePage/ProfilePage.dart';
import 'package:social_media/Pages/UserProfile/ProfilePages.dart';
import 'package:social_media/Pages/UserProfile/UpdateProfilePage.dart';

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
  //
  GetPage(
    name: "/profilePage",
    page: () => ProfilePage(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/contactPage",
    page: () => ContactPage(),
    transition: Transition.rightToLeft,
  ),
  // GetPage(
  //   name: "/singlechatpage",
  //   page: () => SingleChatPage(),
  //   transition: Transition.rightToLeft,
  // ),
  // GetPage(
  //   name: "/userProfilePage",
  //   page: () => UserProfilePage(),
  //   transition: Transition.rightToLeft,
  // ),
  // GetPage(
  //   name: "/userupdateProfilePage",
  //   page: () => UserUpdateProfilePage(),
  //   transition: Transition.rightToLeft,
  // ),
];
