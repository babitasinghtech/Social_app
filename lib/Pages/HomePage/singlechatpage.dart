import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/config/images.dart';

// Color constants
const dBackgroundColor = Color(0xff191B28);
const dPrimaryColor = Color(0xff0057FF);
const dContainerColor = Color(0xff34374B);
const dOnBackgroundColor = Color(0xff888888);
const donContainerColor = Color(0xffFFFFFF);

class SingleChatPage extends StatefulWidget {
  const SingleChatPage({super.key});

  @override
  State<SingleChatPage> createState() => _SingleChatPageState();
}

class _SingleChatPageState extends State<SingleChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  // Sample messages data - replace with your actual data source
  List<ChatMessage> messages = [
    ChatMessage(
      text: "Hello! How are you doing today?",
      isMe: false,
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    ChatMessage(
      text: "Hi! I'm doing great, thanks for asking. How about you?",
      isMe: true,
      timestamp: DateTime.now().subtract(const Duration(hours: 1, minutes: 55)),
    ),
    ChatMessage(
      text: "I'm doing well too! Just working on some projects.",
      isMe: false,
      timestamp: DateTime.now().subtract(const Duration(hours: 1, minutes: 30)),
    ),
    ChatMessage(
      text: "That sounds interesting! What kind of projects?",
      isMe: true,
      timestamp: DateTime.now().subtract(const Duration(hours: 1, minutes: 15)),
    ),
    ChatMessage(
      text: "Mostly mobile app development with Flutter. It's really exciting!",
      isMe: false,
      timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
    ),
  ];

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        messages.add(
          ChatMessage(
            text: _messageController.text.trim(),
            isMe: true,
            timestamp: DateTime.now(),
          ),
        );
      });
      _messageController.clear();
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get user data from navigation arguments (optional)
    final arguments = Get.arguments as Map<String, dynamic>?;
    final String userName = arguments?['name'] ?? 'User';
    final String userImage =
        arguments?['imageUrl'] ?? AssetsImage.defaultProfileUrl;
    final bool isOnline = arguments?['isOnline'] ?? false;

    return Scaffold(
      backgroundColor: dBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: dContainerColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: donContainerColor),
          onPressed: () => Get.back(),
        ),
        title: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(userImage),
                  backgroundColor: dOnBackgroundColor,
                ),
                if (isOnline)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: dContainerColor, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  userName,
                  style: const TextStyle(
                    color: donContainerColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  isOnline ? 'Online' : 'Last seen recently',
                  style: const TextStyle(
                    color: dOnBackgroundColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam, color: donContainerColor),
            onPressed: () {
              // Implement video call functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.call, color: donContainerColor),
            onPressed: () {
              // Implement voice call functionality
            },
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: donContainerColor),
            color: dContainerColor,
            onSelected: (value) {
              // Handle menu selection
              switch (value) {
                case 'view_profile':
                  // Navigate to user profile
                  break;
                case 'media':
                  // Show media gallery
                  break;
                case 'search':
                  // Search in chat
                  break;
                case 'mute':
                  // Mute notifications
                  break;
                case 'block':
                  // Block user
                  break;
              }
            },
            itemBuilder:
                (context) => [
                  const PopupMenuItem(
                    value: 'view_profile',
                    child: Text(
                      'View Profile',
                      style: TextStyle(color: donContainerColor),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'media',
                    child: Text(
                      'Media, Links, and Docs',
                      style: TextStyle(color: donContainerColor),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'search',
                    child: Text(
                      'Search',
                      style: TextStyle(color: donContainerColor),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'mute',
                    child: Text(
                      'Mute Notifications',
                      style: TextStyle(color: donContainerColor),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'block',
                    child: Text('Block', style: TextStyle(color: Colors.red)),
                  ),
                ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Messages List
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ChatBubble(message: message);
              },
            ),
          ),
          // Message Input
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: dContainerColor,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, -1),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.3),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  // Attachment button
                  IconButton(
                    icon: const Icon(
                      Icons.attach_file,
                      color: dOnBackgroundColor,
                    ),
                    onPressed: () {
                      // Implement file attachment
                      _showAttachmentOptions(context);
                    },
                  ),
                  // Text input
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: dBackgroundColor,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: dOnBackgroundColor.withOpacity(0.3),
                        ),
                      ),
                      child: TextField(
                        controller: _messageController,
                        style: const TextStyle(color: donContainerColor),
                        decoration: const InputDecoration(
                          hintText: 'Type a message...',
                          hintStyle: TextStyle(color: dOnBackgroundColor),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                        maxLines: null,
                        textInputAction: TextInputAction.newline,
                        onSubmitted: (_) => _sendMessage(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Send button
                  Container(
                    decoration: const BoxDecoration(
                      color: dPrimaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: donContainerColor),
                      onPressed: _sendMessage,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAttachmentOptions(BuildContext context) {
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
                const Text(
                  'Share',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: donContainerColor,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _AttachmentOption(
                      icon: Icons.photo_camera,
                      label: 'Camera',
                      onTap: () {
                        Get.back();
                        // Implement camera functionality
                      },
                    ),
                    _AttachmentOption(
                      icon: Icons.photo_library,
                      label: 'Gallery',
                      onTap: () {
                        Get.back();
                        // Implement gallery functionality
                      },
                    ),
                    _AttachmentOption(
                      icon: Icons.insert_drive_file,
                      label: 'Document',
                      onTap: () {
                        Get.back();
                        // Implement document picker
                      },
                    ),
                    _AttachmentOption(
                      icon: Icons.location_on,
                      label: 'Location',
                      onTap: () {
                        Get.back();
                        // Implement location sharing
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
    );
  }
}

class _AttachmentOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _AttachmentOption({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: dPrimaryColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: dPrimaryColor, size: 24),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: donContainerColor),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment:
            message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!message.isMe) ...[
            CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage(AssetsImage.defaultProfileUrl),
              backgroundColor: dOnBackgroundColor,
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: message.isMe ? dPrimaryColor : dContainerColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                  bottomLeft: Radius.circular(message.isMe ? 20 : 4),
                  bottomRight: Radius.circular(message.isMe ? 4 : 20),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 3,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.text,
                    style: TextStyle(
                      color:
                          message.isMe ? donContainerColor : donContainerColor,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _formatTime(message.timestamp),
                    style: TextStyle(
                      color:
                          message.isMe
                              ? donContainerColor.withOpacity(0.7)
                              : dOnBackgroundColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${timestamp.day}/${timestamp.month}';
    }
  }
}

class ChatMessage {
  final String text;
  final bool isMe;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.isMe,
    required this.timestamp,
  });
}
