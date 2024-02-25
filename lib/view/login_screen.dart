import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/utils/routes/routes_name.dart';

class LoginScreens extends StatelessWidget {
  const LoginScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, RoutesName.login),
          child: const Text('Home Screen'),
        ),
      ),
    );
  }
}
