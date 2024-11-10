import 'package:shopy_app/feature/login/data/model/login_model.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginModel model;

  LoginSuccessState({required this.model});
}

class LoginFailureState extends LoginState {
  final String errorMessage;

  LoginFailureState({required this.errorMessage});
}

class LoginChangeIconPasswordState extends LoginState {}
