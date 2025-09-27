import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/Pages/HomePage/singlechatpage.dart';
import 'package:social_media/config/images.dart';

// Color constants
const dBackgroundColor = Color(0xff191B28);
const dPrimaryColor = Color(0xff0057FF);
const dContainerColor = Color(0xff34374B);
const dOnBackgroundColor = Color(0xff888888);
const donContainerColor = Color(0xffFFFFFF);

class ChatInSidePage extends StatefulWidget {
  const ChatInSidePage({super.key});

  @override
  State<ChatInSidePage> createState() => _ChatInSidePageState();
}

class _ChatInSidePageState extends State<ChatInSidePage> {
  final TextEditingController _searchController = TextEditingController();
  List<ChatUser> _filteredUsers = [];

  // Sample chat users data - replace with your actual data source
  final List<ChatUser> _allUsers = [
    ChatUser(
      id: "1",
      name: "Lori",
      imageUrl: AssetsImage.defaultProfileUrl,
      lastMessage: "Have a good day!",
      lastTime: "09:30 PM",
      unreadCount: 2,
      isOnline: true,
    ),
    ChatUser(
      id: "2",
      name: "Mary",
      imageUrl: AssetsImage.defaultProfileUrl,
      lastMessage: "See you tomorrow",
      lastTime: "08:45 PM",
      unreadCount: 0,
      isOnline: false,
    ),
    ChatUser(
      id: "3",
      name: "Miranda",
      imageUrl: AssetsImage.defaultProfileUrl,
      lastMessage: "Thanks for the help!",
      lastTime: "07:20 PM",
      unreadCount: 1,
      isOnline: true,
    ),
    ChatUser(
      id: "4",
      name: "Charlie",
      imageUrl: AssetsImage.defaultProfileUrl,
      lastMessage: "Hmm okay",
      lastTime: "06:15 PM",
      unreadCount: 0,
      isOnline: false,
    ),
    ChatUser(
      id: "5",
      name: "James",
      imageUrl: AssetsImage.defaultProfileUrl,
      lastMessage: "Thik hai bhai",
      lastTime: "05:30 PM",
      unreadCount: 3,
      isOnline: true,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _filteredUsers = _allUsers;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterUsers(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredUsers = _allUsers;
      } else {
        _filteredUsers =
            _allUsers
                .where(
                  (user) =>
                      user.name.toLowerCase().contains(query.toLowerCase()) ||
                      user.lastMessage.toLowerCase().contains(
                        query.toLowerCase(),
                      ),
                )
                .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dBackgroundColor,
      child: Column(
        children: [
          // Chat List
          Expanded(
            child: Container(
              color: dBackgroundColor,
              child:
                  _filteredUsers.isEmpty
                      ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.chat_bubble_outline,
                              size: 64,
                              color: dOnBackgroundColor,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'No chats found',
                              style: TextStyle(
                                fontSize: 16,
                                color: dOnBackgroundColor,
                              ),
                            ),
                          ],
                        ),
                      )
                      : ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        itemCount: _filteredUsers.length,
                        separatorBuilder:
                            (context, index) => Divider(
                              height: 1,
                              thickness: 0.5,
                              indent: 80,
                              color: dOnBackgroundColor.withOpacity(0.3),
                            ),
                        itemBuilder: (context, index) {
                          final user = _filteredUsers[index];
                          return InkWell(
                            onTap: () {
                              // Simple navigation without named routes
                              try {
                                Get.to(
                                  () => const SingleChatPage(),
                                  arguments: {
                                    'id': user.id,
                                    'name': user.name,
                                    'imageUrl': user.imageUrl,
                                    'isOnline': user.isOnline,
                                  },
                                );
                              } catch (e) {
                                print('Navigation error: $e');
                                // Fallback navigation
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => const SingleChatPage(),
                                    settings: RouteSettings(
                                      arguments: {
                                        'id': user.id,
                                        'name': user.name,
                                        'imageUrl': user.imageUrl,
                                        'isOnline': user.isOnline,
                                      },
                                    ),
                                  ),
                                );
                              }
                            },
                            onLongPress: () {
                              _showChatOptions(context, user);
                            },
                            child: Container(
                              color: dBackgroundColor,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              child: Row(
                                children: [
                                  // Profile Image with Online Indicator
                                  Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 28,
                                        backgroundImage: NetworkImage(
                                          user.imageUrl,
                                        ),
                                        backgroundColor: dOnBackgroundColor,
                                      ),
                                      if (user.isOnline)
                                        Positioned(
                                          bottom: 2,
                                          right: 2,
                                          child: Container(
                                            width: 12,
                                            height: 12,
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: dBackgroundColor,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(width: 16),

                                  // Chat Info
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              user.name,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: donContainerColor,
                                              ),
                                            ),
                                            Text(
                                              user.lastTime,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color:
                                                    user.unreadCount > 0
                                                        ? dPrimaryColor
                                                        : dOnBackgroundColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                user.lastMessage,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color:
                                                      user.unreadCount > 0
                                                          ? donContainerColor
                                                          : dOnBackgroundColor,
                                                  fontWeight:
                                                      user.unreadCount > 0
                                                          ? FontWeight.w500
                                                          : FontWeight.normal,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            if (user.unreadCount > 0)
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 4,
                                                    ),
                                                decoration: const BoxDecoration(
                                                  color: dPrimaryColor,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Text(
                                                  user.unreadCount.toString(),
                                                  style: const TextStyle(
                                                    color: donContainerColor,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
            ),
          ),
        ],
      ),
    );
  }

  void _showChatOptions(BuildContext context, ChatUser user) {
    showModalBottomSheet(
      context: context,
      backgroundColor: dContainerColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (context) => Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: dOnBackgroundColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  user.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: donContainerColor,
                  ),
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: const Icon(Icons.push_pin, color: donContainerColor),
                  title: const Text(
                    'Pin Chat',
                    style: TextStyle(color: donContainerColor),
                  ),
                  onTap: () {
                    Get.back();
                    // Implement pin functionality
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.volume_off,
                    color: donContainerColor,
                  ),
                  title: const Text(
                    'Mute Notifications',
                    style: TextStyle(color: donContainerColor),
                  ),
                  onTap: () {
                    Get.back();
                    // Implement mute functionality
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.archive, color: donContainerColor),
                  title: const Text(
                    'Archive Chat',
                    style: TextStyle(color: donContainerColor),
                  ),
                  onTap: () {
                    Get.back();
                    // Implement archive functionality
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.delete, color: Colors.red),
                  title: const Text(
                    'Delete Chat',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    Get.back();
                    _showDeleteConfirmation(context, user);
                  },
                ),
              ],
            ),
          ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, ChatUser user) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: dContainerColor,
            title: const Text(
              'Delete Chat',
              style: TextStyle(color: donContainerColor),
            ),
            content: Text(
              'Are you sure you want to delete chat with ${user.name}?',
              style: const TextStyle(color: dOnBackgroundColor),
            ),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: dOnBackgroundColor),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                  // Implement delete functionality
                  setState(() {
                    _allUsers.removeWhere((u) => u.id == user.id);
                    _filteredUsers.removeWhere((u) => u.id == user.id);
                  });
                  Get.snackbar(
                    'Chat Deleted',
                    'Chat with ${user.name} has been deleted',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: dContainerColor,
                    colorText: donContainerColor,
                  );
                },
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
    );
  }
}

// Data model for chat users
class ChatUser {
  final String id;
  final String name;
  final String imageUrl;
  final String lastMessage;
  final String lastTime;
  final int unreadCount;
  final bool isOnline;

  ChatUser({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.lastMessage,
    required this.lastTime,
    required this.unreadCount,
    required this.isOnline,
  });
}
