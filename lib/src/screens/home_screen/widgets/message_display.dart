import 'package:flutter/material.dart';
import 'package:wack/src/screens/home_screen/models/message.dart';

class MessageDisplay extends StatelessWidget {
  final Message message;

  const MessageDisplay({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        children: [
          message.profilePic,
          const SizedBox(width: 10),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message.userName,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(message.messageText, style: TextStyle(fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }
}
