import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/view_model/auth_view_model.dart';
import 'package:flutter_mvvm_architecture/view_model/home_view_model.dart';
import 'package:flutter_mvvm_architecture/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class Injector extends StatelessWidget {
  const Injector({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ChangeNotifierProvider(create: (context) => UserViewModel()),
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
      ],
      child: child,
    );
  }
}
