import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Sign in page'),
        ]),
      ),
    );
  }
}