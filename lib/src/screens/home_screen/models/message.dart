import 'package:flutter/material.dart';

class Message {
  final Image profilePic;
  final String userName;
  final String messageText;

  const Message({
    required this.profilePic,
    required this.userName,
    required this.messageText,
  });
}
