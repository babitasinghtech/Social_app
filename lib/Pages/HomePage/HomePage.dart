import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_media/Controller/ImagePicker.dart';
import 'package:social_media/Controller/ProfileController.dart';
import 'package:social_media/Pages/Chat/chatPage.dart';
import 'package:social_media/Pages/HomePage/widget/Tabbar.dart';
import 'package:social_media/Pages/ProfilePage/profilePage.dart';
import 'package:social_media/config/String.dart';
import 'package:social_media/config/images.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    ProfileController profileController = Get.put(ProfileController());
    ImagePickerController imagePickerController = Get.put(
      ImagePickerController(),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          AppString.appName,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(AssetsImage.appIconSVG, width: 20),
        ),
        actions: [
          IconButton(
            onPressed: () {
              imagePickerController.pickImage();
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () async {
              await profileController.getUserDetails();
              // Get.toNamed("/ProfilePage");
              Get.to(ProfilePage());
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
        bottom: MyTabBar(tabController, context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/contactPage");
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          // ignore: deprecated_member_use
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: TabBarView(
          controller: tabController,
          children: [
            // ChatPage(userModel: someUserModel),
            Center(child: Text("Select a user to start chatting")),
            ListView(children: [ListTile(title: Text("Hema"))]),
            ListView(children: [ListTile(title: Text("Hema"))]),
          ],
        ),
      ),
    );
  }
}
