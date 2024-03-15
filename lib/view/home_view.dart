import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/configs/routes/routes_name.dart';
import 'package:flutter_mvvm_architecture/data/response/status.dart';
import 'package:flutter_mvvm_architecture/view_model/home/home_view_model.dart';
import 'package:flutter_mvvm_architecture/view_model/services/storage/local_storage.dart';
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
            onPressed: () {
              LocalStorage localStorage = LocalStorage();
              localStorage.clearValue('token').then((value) {
                Navigator.pushNamed(context, RouteNames.login);
              });
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, value, _) {
          final movies = value.moviesList.data?.movies;
          switch (value.moviesList.status) {
            case Status.loading:
              return const Center(child: CircularProgressIndicator());
            case Status.error:
              return Center(child: Text('Error: ${value.moviesList.message}'));
            case Status.completed:
              return ListView.builder(
                itemCount: movies?.length ?? 0,
                itemBuilder: (context, index) {
                  final movie = movies?[index];
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        movie!.posterurl.toString(),
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.error);
                        },
                        width: 70,
                      ),
                      title: Text(movie.title.toString()),
                      subtitle: Text(movie.year.toString()),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                              '${((movie.ratings?.reduce((value, element) => value + element)) / movie.ratings?.length).toStringAsFixed(1)}'),
                          const Icon(Icons.star, color: Colors.yellow),
                        ],
                      ),
                    ),
                  );
                },
              );
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
