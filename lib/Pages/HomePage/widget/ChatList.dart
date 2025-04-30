import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:social_media/Pages/HomePage/widget/ChatTile.dart';
import 'package:social_media/conflig/images.dart';

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
            imageUrl: AssetsImage.girlpic,
            name: "Lori",
            lastChat: "have a Good Day",
            lastTime: "09:30 PM",
          ),
        ),
        ChatTile(
          imageUrl: AssetsImage.girlpic,
          name: "mary",
          lastChat: "have a Good Day",
          lastTime: "09:30 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.girlpic,
          name: "mirinada",
          lastChat: "have a Good Day",
          lastTime: "09:30 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.girlpic,
          name: "charlie",
          lastChat: "Hmmbe",
          lastTime: "09:30 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.boypic,
          name: "james",
          lastChat: "thik hai bhai",
          lastTime: "09:30 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.girlpic,
          name: "Lori",
          lastChat: "have a Good Day",
          lastTime: "09:30 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.girlpic,
          name: "Lori",
          lastChat: "have a Good Day",
          lastTime: "09:30 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.girlpic,
          name: "Lori",
          lastChat: "have a Good Day",
          lastTime: "09:30 PM",
        ),
      ],
    );
  }
}
