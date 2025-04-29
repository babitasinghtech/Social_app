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
      ],
    );
  }
}
