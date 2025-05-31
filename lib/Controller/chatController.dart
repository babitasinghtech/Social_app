import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:social_media/model/ChatModel.dart';

class ChatController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;
  // Generate consistent room ID between two users
  String getRoomId(String targetUserId) {
    String currentUserId = auth.currentUser!.uid;

    if (currentUserId.codeUnitAt(0) > targetUserId.codeUnitAt(0)) {
      return currentUserId + targetUserId;
    } else {
      return targetUserId + currentUserId;
    }
  }

  Future<void> sendMessage(String targetUserId, ChatModel chatModel) async {
    String roomId = getRoomId(targetUserId);

    try {
      await db
          .collection("chats")
          .doc(roomId)
          .collection("message")
          .doc(chatModel.id)
          .set(chatModel.toJson());
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }
}
