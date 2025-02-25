import 'package:flutter/material.dart';
import 'package:wack/src/screens/home_screen/channels_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String screenId = 'login_screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userNameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter your username and\nlog in',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 3,
                child: TextFormField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Enter your username',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username cannot be null';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _onLoginPressed(context),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.purple),
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 26, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onLoginPressed(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, ChannelsScreen.screenId);
    }
  }
}
