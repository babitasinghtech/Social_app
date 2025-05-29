import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:social_media/Pages/HomePage/widget/ChatTile.dart';
import 'package:social_media/config/images.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        InkWell(
          onTap: () {
            Get.toNamed("/SingleChatPage");
          },
          child: ChatTile(
            imageUrl: AssetsImage.defaultProfileUrl,
            name: "Lori",
            lastChat: "have a Good Day",
            lastTime: "09:30 PM",
          ),
        ),
        ChatTile(
          imageUrl: AssetsImage.defaultProfileUrl,
          name: "mary",
          lastChat: "have a Good Day",
          lastTime: "09:30 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.defaultProfileUrl,
          name: "mirinada",
          lastChat: "have a Good Day",
          lastTime: "09:30 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.defaultProfileUrl,
          name: "charlie",
          lastChat: "Hmmbe",
          lastTime: "09:30 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.defaultProfileUrl,
          name: "james",
          lastChat: "thik hai bhai",
          lastTime: "09:30 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.defaultProfileUrl,
          name: "Lori",
          lastChat: "have a Good Day",
          lastTime: "09:30 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.defaultProfileUrl,
          name: "Lori",
          lastChat: "have a Good Day",
          lastTime: "09:30 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.defaultProfileUrl,
          name: "Lori",
          lastChat: "have a Good Day",
          lastTime: "09:30 PM",
        ),
      ],
    );
  }
}
