import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:bubble/bubble.dart';

class MessageBubble extends StatelessWidget {
  String message;
  bool isMe;
  String sender;
  String senderImgUrl;
  String keyid;

  MessageBubble(
      {this.message, this.sender, this.isMe, this.senderImgUrl, this.keyid});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      if (isMe == false)
        Positioned(
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            height: 25,
            width: 25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: CachedNetworkImage(
                imageUrl: senderImgUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      Row(
        mainAxisAlignment:
            (isMe == true) ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: (isMe == true) ? 0 : 20,
                bottom: 10,
                right: (isMe == true) ? 5 : 0),
            key: ValueKey(keyid),
            width: MediaQuery.of(context).size.width * 0.7,
            child: Bubble(
              nip:
                  (isMe == true) ? BubbleNip.rightBottom : BubbleNip.leftBottom,
              child: (isMe == true)
                  ? Text(
                      message,
                      softWrap: true,
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sender,
                          softWrap: true,
                          style: TextStyle(color: Colors.black54, fontSize: 10),
                        ),
                        Text(
                          message,
                          softWrap: true,
                        )
                      ],
                    ),
            ),
          )
        ],
      ),
    ]);
  }
}
