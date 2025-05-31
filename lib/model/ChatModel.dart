class ChatModel {
  final String id;
  final String message;
  final String senderName;
  final String senderId;
  final String receiverId;
  final String timestamp;
  final String readStatus;
  final String imageUrl;
  final String videoUrl;
  final String audioUrl;
  final String documentUrl;
  final List<String> reactions;
  final List<dynamic> replies;

  ChatModel({
    required this.id,
    required this.message,
    required this.senderName,
    required this.senderId,
    required this.receiverId,
    required this.timestamp,
    required this.readStatus,
    required this.imageUrl,
    required this.videoUrl,
    required this.audioUrl,
    required this.documentUrl,
    required this.reactions,
    required this.replies,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'] ?? '',
      message: json['message'] ?? '',
      senderName: json['senderName'] ?? '',
      senderId: json['senderId'] ?? '',
      receiverId: json['receiverId'] ?? '',
      timestamp: json['timestamp'] ?? '',
      readStatus: json['readStatus'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      videoUrl: json['videoUrl'] ?? '',
      audioUrl: json['audioUrl'] ?? '',
      documentUrl: json['documentUrl'] ?? '',
      reactions: List<String>.from(json['reactions'] ?? []),
      replies: List<dynamic>.from(json['replies'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'message': message,
      'senderName': senderName,
      'senderId': senderId,
      'receiverId': receiverId,
      'timestamp': timestamp,
      'readStatus': readStatus,
      'imageUrl': imageUrl,
      'videoUrl': videoUrl,
      'audioUrl': audioUrl,
      'documentUrl': documentUrl,
      'reactions': reactions,
      'replies': replies,
    };
  }
}
