import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/configs/locator.dart';
import 'package:flutter_mvvm_architecture/repository/auth_api/auth_repository.dart';
import 'package:flutter_mvvm_architecture/repository/home_api/home_repository.dart';
import 'package:flutter_mvvm_architecture/view_model/auth/auth_view_model.dart';
import 'package:flutter_mvvm_architecture/view_model/home/home_view_model.dart';
import 'package:provider/provider.dart';

class Injector extends StatelessWidget {
  const Injector({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(getIt<AuthRepository>()),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(getIt<HomeRepository>()),
        ),
      ],
      child: child,
    );
  }
}
