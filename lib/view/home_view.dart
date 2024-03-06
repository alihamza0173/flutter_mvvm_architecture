import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/view_model/home_view_model.dart';
import 'package:flutter_mvvm_architecture/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<HomeViewModel>().fetchMoviesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => context.read<UserViewModel>().logout(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Consumer(
        builder: (context, value, _) {
          // context.watch<HomeViewModel>().
          return const Text('data');
        },
      ),
    );
  }
}
