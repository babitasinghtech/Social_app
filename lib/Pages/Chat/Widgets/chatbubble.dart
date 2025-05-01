import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_media/conflig/images.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isComing;
  final String time;
  final String status;
  final String imageUrl;
  const ChatBubble({
    super.key,
    required this.message,
    required this.isComing,
    required this.time,
    required this.status,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isComing? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Text(message),
        ),
        SizedBox(height: 3),
           Row(
              // crossAxisAlignmnet: isComing? CrossAxisAlignment.start: CrosssAxisAlignment.end,
              mainAxisAlignment: isComing? MainAxisAlignment.start: MainAxisAlignment.end,
              children: [
                isComing
                    ? Text(time)
                    : Row(
                      children: [
                        Text(time),
                        SvgPicture.asset(AssetsImage.chatSeenSVG,
                        width:20),
                      ],
                    ),
              ],
            ),
      ],
    );
  }
}
