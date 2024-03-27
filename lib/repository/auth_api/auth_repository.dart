import 'package:flutter_mvvm_architecture/model/users_list/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> loginApi(dynamic data);
  Future<UserModel> registerApi(dynamic data);
}
