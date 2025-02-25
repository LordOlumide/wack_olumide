import 'package:flutter/material.dart';
import 'package:wack/src/screens/auth/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String screenId = 'splash_screen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the next screen after 3 seconds
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, LoginScreen.screenId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/logo.png'), // Display your logo
      ),
    );
  }
}
