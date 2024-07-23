import 'package:flutter/material.dart';
import 'package:mental_health_app/models/message.dart';

class ChatBubble extends StatelessWidget {
  Message msg;
  ChatBubble(
      {super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: (msg.isSent)? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: (msg.isSent)? Colors.blue[800] : Colors.blueGrey[100] ,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                          child: Text(
                            msg.content,
                            style: TextStyle(
                              fontSize: 15,
                              color: (msg.isSent)? Colors.white:Colors.black
                            ),
                            softWrap: true,

                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 5,
                            top: 15
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              msg.time,
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 10,
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
