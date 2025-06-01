import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:social_media/Controller/ContactController.dart';
import 'package:social_media/Controller/chatController.dart';
import 'package:social_media/Pages/Chat/chatPage.dart';
import 'package:social_media/Pages/ContactPage/Widgets/NewContactTile.dart';
import 'package:social_media/Pages/ContactPage/Widgets/contactsearch.dart';
import 'package:social_media/Pages/HomePage/widget/ChatTile.dart';
import 'package:social_media/config/images.dart';

class ContactPage extends StatelessWidget {
  //chat page

  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isSearchEnable = false.obs;
    ContactController contactController = Get.put(ContactController());

    ChatController chatController = Get.put(ChatController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Contact"),
        actions: [
          Obx(
            () => IconButton(
              onPressed: () {
                isSearchEnable.value = !isSearchEnable.value;
              },
              icon:
                  isSearchEnable.value ? Icon(Icons.close) : Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Obx(() => isSearchEnable.value ? Contactsearch() : SizedBox()),
            SizedBox(height: 10),
            NewContacttile(
              btnName: "New Contact",
              icon: Icons.person_add,
              ontap: () {},
            ),
            SizedBox(height: 10),
            NewContacttile(
              btnName: "New Group ",
              icon: Icons.group_add,
              ontap: () {},
            ),
            SizedBox(height: 10),
            Row(children: [Text("Contacts with Peoples")]),
            SizedBox(height: 10),
            Column(
              children:
                  contactController.userList
                      .map(
                        (e) => InkWell(
                          onTap: () {
                            Get.to(ChatPage(userModel: e));
                            // Get.toNamed("/SingleChatPage", arguments: e);
                          },
                          child: ChatTile(
                            imageUrl:
                                e.profileImage ?? AssetsImage.defaultProfileUrl,
                            name: e.name ?? "User",
                            lastChat: e.about ?? "have a Good Day",
                            lastTime: "",
                          ),
                        ),
                      )
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
