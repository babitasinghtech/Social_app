import 'package:flutter/material.dart';
import 'package:social_media/Pages/Chat/Widgets/chatbubble.dart';
import 'package:social_media/conflig/images.dart';

class SingleChatPage extends StatelessWidget {
  const SingleChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(AssetsImage.girlpic),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Lori"),
            Text("Online", style: Theme.of(context).textTheme.labelSmall),
          ],
        ),

        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),

          IconButton(onPressed: () {}, icon: const Icon(Icons.video_call)),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ChatBubble(
              massage: "hhjhjhjhjhjjhjjhjjhjjhjjhjjhjjhjjhjjhjjj",
              isComming: true,
              imageUrl: "",
              status: "seen",
              time: "10:00 AM",
            ),
          ],
        ),
      ),
    );
  }
}
