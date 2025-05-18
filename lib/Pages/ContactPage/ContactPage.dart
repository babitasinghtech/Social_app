import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:social_media/Pages/ContactPage/Widgets/NewContactTile.dart';
import 'package:social_media/Pages/ContactPage/Widgets/contactsearch.dart';
import 'package:social_media/Pages/HomePage/widget/ChatTile.dart';
import 'package:social_media/conflig/images.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isSearchEnable = false.obs;
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
            ),
          ],
        ),
      ),
    );
  }
}
