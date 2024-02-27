class UserModel {
  final String? token;

  UserModel({this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(token: json['token']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    return data;
  }
}
