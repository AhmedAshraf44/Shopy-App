class LoginModel {
  final bool status;
  final String? message;
  final UserModel? data;

  LoginModel({required this.status, required this.message, required this.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? UserModel.fromJson(json['data']) : null,
    );
  }
}

class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final String token;
  final dynamic points;
  final dynamic credit;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.image,
      required this.token,
      required this.points,
      required this.credit});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      token: json['token'],
      points: json['points'],
      credit: json['credit'],
    );
  }
}
