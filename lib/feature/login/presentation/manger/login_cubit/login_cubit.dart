import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_app/feature/login/data/repos/login_repo.dart';
import 'package:shopy_app/feature/login/presentation/manger/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  bool obscureText = true;
  void changeIconPassword() {
    obscureText = !obscureText;
    emit(LoginChangeIconPasswordState());
  }

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final LoginRepo loginRepo;
  Future<void> loginUser() async {
    emit(LoginLoadingState());
    var result = await loginRepo.loginUser(
        email: emailController.text, password: passwordController.text);

    result.fold(
        (failure) =>
            emit(LoginFailureState(errorMessage: failure.errorMessage)),
        (data) => emit(LoginSuccessState(model: data)));
  }
}
