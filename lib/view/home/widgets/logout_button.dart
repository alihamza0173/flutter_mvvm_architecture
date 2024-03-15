import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/configs/routes/routes_name.dart';
import 'package:flutter_mvvm_architecture/view_model/services/storage/local_storage.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        LocalStorage localStorage = LocalStorage();
        localStorage.clearValue('token').then((value) {
          Navigator.pushNamed(context, RouteNames.login);
        });
      },
      icon: const Icon(Icons.logout),
    );
  }
}
