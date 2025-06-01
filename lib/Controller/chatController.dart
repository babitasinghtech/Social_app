import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:social_media/Controller/ProfileController.dart';
import 'package:social_media/model/ChatModel.dart';
import 'package:uuid/uuid.dart';

class ChatController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;
  var uuid = Uuid();
  ProfileController controller = Get.put(ProfileController());
  // Generate consistent room ID between two users
  String getRoomId(String targetUserId) {
    String currentUserId = auth.currentUser!.uid;

    if (currentUserId.codeUnitAt(0) > targetUserId.codeUnitAt(0)) {
      return currentUserId + targetUserId;
    } else {
      return targetUserId + currentUserId;
    }
  }

  Future<void> sendMessage(String targetUserId, String message) async {
    isLoading.value = true;
    String chatId = uuid.v6();
    String roomId = getRoomId(targetUserId);

    var newChat = ChatModel(
      id: chatId,
      message: message,
      senderId: auth.currentUser!.uid,
      receiverId: targetUserId,
      senderName: controller.currentUser.value.name ?? 'Unknown',
      timestamp: DateTime.now(),
      readStatus: 'unread',
      imageUrl: "",
      videoUrl: "",
      audioUrl: "",
      documentUrl: "",
      reactions: [],
      replies: [],
    );
    try {
      await db
          .collection("chats")
          .doc(roomId)
          .collection("message")
          .doc(chatId)
          .set(newChat.toJson());
    } catch (e) {
      print("Error sending message:$e");
    }
    isLoading.value = false;
  }
}
