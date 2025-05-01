import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Row(
          children: [
             Container(
              width: 30,
              height: 30,

            SvgPicture.asset(AssetsImage.chatMicSVG, width: 25),
             ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  filled: false,
                  hintText: "Type a message.......",
                ),
              ),
            ),
            SizedBox(width: 10),

             Container(
              width: 30,
              height: 30,

            SvgPicture.asset(AssetsImage.chatGallerySVG,width: 25),
             ),
            SizedBox(width: 10),
            Container(
              width: 30,
              height: 30,

              child: SvgPicture.asset(AssetsImage.chatSendSVG,width: 25),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            ChatBubble(
              message: "Hello Lori How are you?",
              isComing: true,
              imageUrl: "",
              status: "seen",
              time: "10:00 AM",
            ),
            ChatBubble(
              message: "I'm perfactly fine",
              isComing: false,
              imageUrl: "",
              status: "seen",
              time: "10:01 AM",
            ),
            ChatBubble(
              message: "Do you have some knowledge about GoogleCloud",
              isComing: false,
              imageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyDN-MudJPSedBOTxMj6q9ni7G1-o49uk8Xg&s",
              status: "seen",
              time: "10:01 AM",
            ),
            ChatBubble(
              message: "No don't have any knowledge about it",
              isComing: true,
              imageUrl: "",
              status: "seen",
              time: "10:01 AM",
            ),
            ChatBubble(
              message: "but I have some knowledge about AWS",
              isComing: true,
              status: "seen",
              time: "10:01 AM",
              imageUrl: "",
            ),
            ChatBubble(
              message:
                  "Ohk its perfect now you can easily learn about this topic",
              isComing: false,
              imageUrl: "",
              status: "seen",
              time: "10:01 AM",
            ),
            ChatBubble(
              message:
                  "Yes you are right, i serach on google about it, you can check it out",
              isComing: true,
              imageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4IQwf20WhpY5FanP5-POvAjcAoBUIP72YnQ&s",
              status: "seen",
              time: "10:01 AM",
            ),
          ],
        ),
      ),
    );
  }
}
