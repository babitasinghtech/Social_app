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
            borderRadius: isComing ? BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ): 
            BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
          ),
          ),
          child: imageUrl == ""
          ? Text(message): Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Image.network(
                imageUrl
              ),
              SizedBox(height: 5),
              Text(message),
            ],
          ) ,
        ),
        SizedBox(height: 3),
           Row(
              mainAxisAlignment: isComing? MainAxisAlignment.start: MainAxisAlignment.end,
              children: [
                isComing
                    ? Text(time,
                    style:Theme.of(context).textTheme.labelMedium)
                    : Row(
                      children: [
                        Text(time,
                        style:Theme.of(context).textTheme.labelMedium),
                        SizedBox(width: 5),
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
