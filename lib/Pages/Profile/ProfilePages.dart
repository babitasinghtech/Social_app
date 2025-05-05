import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_media/Pages/Profile/Widgets/profileuserinfo.dart';
import 'package:social_media/conflig/images.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [ProfileUserInfo()]),
      ),
    );
  }
}
