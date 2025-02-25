import 'package:flutter/material.dart';
import 'package:wack/src/screens/auth/login/login_screen.dart';
import 'package:wack/src/screens/home_screen/channels_screen.dart';
import 'package:wack/src/screens/home_screen/messages_screen.dart';
import 'package:wack/src/screens/splash_screen/splash_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wack',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: SplashScreen.screenId,
      routes: {
        SplashScreen.screenId: (context) => SplashScreen(),
        LoginScreen.screenId: (context) => LoginScreen(),
        ChannelsScreen.screenId: (context) => ChannelsScreen(),
        MessagesScreen.screenId: (context) {
          final Map<String, dynamic> args =
              ModalRoute.of(context)!.settings.arguments!
                  as Map<String, dynamic>;
          String channelName = args['channel_name']!;
          return MessagesScreen(channelName: channelName);
        },
      },
    );
  }
}
