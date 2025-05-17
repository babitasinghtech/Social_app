import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:social_media/Controller/ProfileController.dart';
import 'package:social_media/config/images.dart';

class ProfileUserInfo extends StatelessWidget {
  const ProfileUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    return Container(
      padding: EdgeInsets.all(20),
      //height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset(AssetsImage.girlpic)],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Text(
                        profileController.currentUser.value.name! == null
                            ? "User"
                            : profileController.currentUser.value.name!,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      profileController.currentUser.value.email!,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 50,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).colorScheme.background,
                      ),

                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AssetsImage.profileAudioCall,
                            width: 25,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Call",
                            style: TextStyle(color: Color(0xff039C00)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).colorScheme.background,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AssetsImage.profileVideocall,
                            width: 25,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Video",
                            style: TextStyle(color: Color(0xffFF9900)),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(width: 5),
                    Container(
                      height: 50,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // ignore: deprecated_member_use
                        color: Theme.of(context).colorScheme.background,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(AssetsImage.appIconSVG, width: 20),
                          SizedBox(width: 10),
                          Text("Chat", style: TextStyle(color: Colors.blue)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
