import 'package:doctor_app/core/theming/colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'LoginScreen',
          style: TextStyle(color: ColorsManager.mainBlue),
        ),
      ),
      body: Center(child: Text('Login Screen')),
    );
  }
}
