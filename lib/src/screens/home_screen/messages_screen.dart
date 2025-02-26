import 'package:flutter/material.dart';
import 'package:wack/src/screens/home_screen/channels_screen.dart';
import 'package:wack/src/screens/home_screen/dummy_data/dummy_messages.dart';
import 'package:wack/src/screens/home_screen/widgets/message_display.dart';

class MessagesScreen extends StatelessWidget {
  static const String screenId = 'messages_screen';

  final String channelName;

  const MessagesScreen({super.key, required this.channelName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        title: FittedBox(child: Text(channelName)),
      ),
      drawer: ChannelsScreen(),
      body: ListView.builder(
        itemCount: dummyMessages.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              MessageDisplay(message: dummyMessages[index]),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
