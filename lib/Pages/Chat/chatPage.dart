import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:social_media/Controller/chatController.dart';
import 'package:social_media/Pages/Chat/Widgets/chatbubble.dart';
import 'package:social_media/config/images.dart';
import 'package:social_media/model/Usermodel.dart';

class ChatPage extends StatelessWidget {
  //ChatPage
  //  final String userId;
  final UserModel userModel;
  const ChatPage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    TextEditingController messageController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(AssetsImage.girlpic),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userModel.name ?? "user",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
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
              child: SvgPicture.asset(AssetsImage.chatMicSVG, width: 25),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: messageController,
                decoration: const InputDecoration(
                  filled: false,
                  hintText: "Type a message.......",
                ),
              ),
            ),
            SizedBox(width: 10),

            Container(
              width: 30,
              height: 30,

              child: SvgPicture.asset(AssetsImage.chatGallerySVG, width: 25),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {
                if (messageController.text.isNotEmpty) {
                  chatController.sendMessage(
                    userModel.id!,
                    messageController.text,
                  );
                  messageController.clear();
                }
              },
              child: Container(
                width: 30,
                height: 30,

                child: SvgPicture.asset(AssetsImage.chatSendSVG, width: 25),
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: StreamBuilder(
          stream: chatController.getMessages(userModel.id!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
            if (snapshot.data == null) {
              return Center(child: Text("No Messages"));
            } else {
              return ListView.builder(
                // ⬅️ Add `return` here
                reverse: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ChatBubble(
                    message: snapshot.data![index].message!,
                    imageUrl: snapshot.data![index].imageUrl ?? "",
                    isComing: true,
                    status: "read",
                    time: "9 AM", // Ideally use actual time from message
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
