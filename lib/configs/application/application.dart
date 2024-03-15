import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/configs/routes/app_routes.dart';
import 'package:flutter_mvvm_architecture/configs/routes/routes_name.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.splash,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
