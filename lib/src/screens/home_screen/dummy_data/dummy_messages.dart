import 'package:flutter/material.dart';
import 'package:wack/src/screens/home_screen/models/message.dart';

List<Message> _templates = [
  Message(
    profilePic: Image.asset('assets/images/profile_pic1.jpg'),
    userName: 'Iron Hearted manager',
    messageText:
        'Hey, peasants. Why is the feature not ready. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce sit amet tortor id nisi semper convallis. Morbi efficitur, neque at ornare sagittis, ex mauris cursus orci, in laoreet est turpis congue odio',
  ),
  Message(
    profilePic: Image.asset('assets/images/profile_pic2.jpg'),
    userName: 'Sleepy Dev',
    messageText:
        'Mauris congue ligula scelerisque lorem lacinia accumsan. Donec justo libero, porta at interdum et, varius id lorem. Nunc rutrum vestibulum lacus, eget dapibus ipsum imperdiet nec. Suspendisse ultrices quis felis nec sodales.',
  ),
  Message(
    profilePic: Image.asset('assets/images/profile_pic3.jpg'),
    userName: 'Raging Loner',
    messageText:
        'Pellentesque vitae fermentum leo. Aenean eros sapien, cursus eget semper vitae, malesuada vel libero. Sed in risus posuere, aliquam dolor ut, mattis metus. Nulla viverra condimentum orci, ut porttitor diam auctor id.',
  ),
];

List<Message> dummyMessages = List.generate(
  20,
  (index) => _templates[_templates.length % 3],
  growable: false,
);
