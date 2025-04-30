import 'package:flutter/material.dart';
import 'package:social_media/Pages/HomePage/widget/ChatTile.dart';
import 'package:social_media/conflig/images.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChatTile(
          imageUrl: AssetsImage.girlpic,
          name: "Lori",
          lastChat: "have a Good Day",
          lastTime: "09:30 PM",
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
