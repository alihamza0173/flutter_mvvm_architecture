import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/utils/routes/app_routes.dart';
import 'package:flutter_mvvm_architecture/utils/routes/routes_name.dart';

class Applicatoin extends StatelessWidget {
  const Applicatoin({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.splash,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
