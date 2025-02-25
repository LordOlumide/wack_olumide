import 'dart:math';

import 'package:wack/src/screens/home_screen/models/channel.dart';
import 'package:word_generator/word_generator.dart';

List<Channel> dummyChannels = List.generate(
  15,
  (index) => Channel(
    name:
        '${capitalizeFirstLetter(WordGenerator().randomVerb())} '
        '${capitalizeFirstLetter(WordGenerator().randomNoun())}',
    noOfUnreadMessages: Random().nextInt(15),
  ),
);

String capitalizeFirstLetter(String input) {
  if (input.isEmpty) {
    return input;
  }
  return input[0].toUpperCase() + input.substring(1).toLowerCase();
}
