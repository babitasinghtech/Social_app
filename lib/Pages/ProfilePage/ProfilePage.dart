import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/Controller/ImagePicker.dart';
import 'package:social_media/Controller/ProfileController.dart';
import 'package:social_media/Widget/primarybutton.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isEdit = false.obs;
    ProfileController profileController = Get.put(ProfileController());
    TextEditingController name = TextEditingController(
      text: profileController.currentUser.value.name,
    );
    TextEditingController email = TextEditingController(
      text: profileController.currentUser.value.email,
    );
    TextEditingController phone = TextEditingController(
      text: profileController.currentUser.value.phoneNumber,
    );
    TextEditingController about = TextEditingController(
      text: profileController.currentUser.value.about,
    );
    ImagePickerController imagepickerController = Get.put(
      ImagePickerController(),
    );
    RxString imagePath = "".obs;
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              //height: 300,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () =>
                                  isEdit.value
                                      ? InkWell(
                                        onTap: () async {
                                          imagePath.value =
                                              await imagepickerController
                                                  .pickImage();
                                          print(
                                            "Image Picked" + imagePath.value,
                                          );
                                        },
                                        child: Container(
                                          height: 200,
                                          width: 200,
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(
                                                  context,
                                                ).colorScheme.background,
                                            borderRadius: BorderRadius.circular(
                                              100,
                                            ),
                                          ),
                                          child:
                                              imagePath.value == ""
                                                  ? Icon(Icons.add)
                                                  : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          100,
                                                        ),
                                                    child: Image.file(
                                                      File(imagePath.value),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                        ),
                                      )
                                      : Container(
                                        height: 200,
                                        width: 200,
                                        decoration: BoxDecoration(
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.background,
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                        ),
                                        child:
                                            imagePath.value == ""
                                                ? Icon(Icons.image)
                                                : ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        100,
                                                      ),
                                                  child: Image.file(
                                                    File(imagePath.value),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                      ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Obx(
                          () => TextField(
                            controller: name,
                            enabled: isEdit.value,
                            decoration: InputDecoration(
                              filled: isEdit.value,
                              labelText: "Name",
                              prefixIcon: Icon(Icons.person),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Obx(
                          () => TextField(
                            controller: about,
                            enabled: isEdit.value,
                            decoration: InputDecoration(
                              filled: isEdit.value,
                              labelText: "About",
                              prefixIcon: Icon(Icons.info),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: email,
                          enabled: false,
                          decoration: InputDecoration(
                            filled: isEdit.value,
                            labelText: "Email",
                            prefixIcon: Icon(Icons.alternate_email),
                          ),
                        ),
                        SizedBox(height: 10),
                        Obx(
                          () => TextField(
                            controller: phone,
                            enabled: isEdit.value,
                            decoration: InputDecoration(
                              filled: isEdit.value,
                              labelText: "Phone No.",
                              prefixIcon: Icon(Icons.phone),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () =>
                                  isEdit.value
                                      ? PrimaryButton(
                                        btnName: "Save",
                                        icon: Icons.save,
                                        ontap: () {
                                          isEdit.value = false;
                                        },
                                      )
                                      : PrimaryButton(
                                        btnName: "Edit",
                                        icon: Icons.edit,
                                        ontap: () {
                                          isEdit.value = true;
                                        },
                                      ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
