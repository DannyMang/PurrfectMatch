// loggedin.dart
import 'package:flutter/material.dart';

class LoggedInScreen extends StatelessWidget {
  const LoggedInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logged In'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'You are logged in!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
