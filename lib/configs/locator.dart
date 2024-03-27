import 'package:flutter_mvvm_architecture/repository/auth_api/auth_repository.dart';
import 'package:flutter_mvvm_architecture/repository/auth_api/auth_services.dart';
import 'package:flutter_mvvm_architecture/repository/home_api/home_repository.dart';
import 'package:flutter_mvvm_architecture/repository/home_api/home_services.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AuthRepository>(AuthServices());

  getIt.registerSingleton<HomeRepository>(HomeServices());
}
