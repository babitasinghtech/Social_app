import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/Controller/ContactController.dart';
import 'package:social_media/Controller/chatController.dart';
import 'package:social_media/Pages/Chat/chatPage.dart';
import 'package:social_media/Pages/ContactPage/Widgets/NewContactTile.dart';
import 'package:social_media/Pages/ContactPage/Widgets/contactsearch.dart';
import 'package:social_media/Pages/HomePage/widget/ChatTile.dart';
import 'package:social_media/config/images.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isSearchEnable = false.obs;
    ContactController contactController = Get.put(ContactController());
    ChatController chatController = Get.put(ChatController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          "Select Contact",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
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
        child: Column(
          children: [
            // Search bar
            Obx(() => isSearchEnable.value ? Contactsearch() : SizedBox()),

            // New Contact and New Group buttons
            Column(
              children: [
                SizedBox(height: 10),
                NewContacttile(
                  btnName: "New Contact",
                  icon: Icons.person_add,
                  ontap: () {
                    // Add new contact functionality
                    print("New Contact tapped");
                  },
                ),
                SizedBox(height: 10),
                NewContacttile(
                  btnName: "New Group",
                  icon: Icons.group_add,
                  ontap: () {
                    // Add new group functionality
                    print("New Group tapped");
                  },
                ),
                SizedBox(height: 20),

                // Header for contacts list
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Contacts with Peoples",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),

            // Contacts List
            Expanded(
              child: Obx(
                () =>
                    contactController.userList.isEmpty
                        ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.contacts_outlined,
                                size: 64,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              SizedBox(height: 16),
                              Text(
                                "No contacts found",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Add some contacts to start chatting",
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ],
                          ),
                        )
                        : ListView.builder(
                          itemCount: contactController.userList.length,
                          itemBuilder: (context, index) {
                            final user = contactController.userList[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: InkWell(
                                onTap: () {
                                  // Navigate to chat page
                                  Get.to(() => ChatPage(userModel: user));
                                },
                                borderRadius: BorderRadius.circular(20),
                                child: ChatTile(
                                  imageUrl:
                                      user.profileImage ??
                                      AssetsImage.defaultProfileUrl,
                                  name: user.name ?? "Unknown User",
                                  lastChat:
                                      user.about ??
                                      "Hey there! I'm using this app.",
                                  lastTime: '',
                                ),
                              ),
                            );
                          },
                        ),
              ),
            ),
          ],
        ),
      ),

      // Floating Action Button for quick add contact
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Quick add contact functionality
          print("Quick add contact");
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.person_add,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
