import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_media/Controller/ProfileController.dart';
import 'package:social_media/Pages/HomePage/widget/ChatList.dart';
import 'package:social_media/Pages/HomePage/widget/Tabbar.dart';
import 'package:social_media/conflig/String.dart';
import 'package:social_media/conflig/images.dart';
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
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
            onPressed: () {
              Get.toNamed("/ProfilePage");
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
        bottom: MyTabBar(tabController, context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
            ChatPage(),
            ListView(children: [ListTile(title: Text("Hema"))]),
            ListView(children: [ListTile(title: Text("Hema"))]),
          ],
        ),
      ),
    );
  }
}
