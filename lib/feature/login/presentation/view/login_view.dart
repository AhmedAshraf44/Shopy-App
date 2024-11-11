import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy_app/constants.dart';
import 'package:shopy_app/core/utils/app_router.dart';
import 'package:shopy_app/core/utils/app_styles.dart';
import 'package:shopy_app/core/utils/cache_helper.dart';
import 'package:shopy_app/feature/login/data/repos/login_repo_impl.dart';
import 'package:shopy_app/feature/login/presentation/manger/login_cubit/login_cubit.dart';
import 'package:shopy_app/feature/login/presentation/manger/login_cubit/login_state.dart';
import '../../../../core/functions/show_toast.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_text_form_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(LoginRepoImpl(ApiService(Dio()))),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              {
                if (state.model.status == false) {
                  showToast(text: state.model.message, color: Colors.amber);
                } else {
                  showToast(text: state.model.message, color: Colors.green);
                  CacheHelper.setData(
                      key: kToken, value: state.model.data!.token);
                  GoRouter.of(context).push(AppRouter.kHomeLayoutView);
                }
              }
            } else if (state is LoginFailureState) {
              showToast(text: state.errorMessage, color: Colors.red);
            }
          },
          builder: (context, state) {
            var cubit = LoginCubit.get(context);
            return Form(
              key: formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'LOGIN',
                          style: AppStyles.textStyle20,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Login now to browse our hot offers',
                          style: AppStyles.textStyle16regular.copyWith(
                            color: Colors.grey[500],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Text('Email Address',
                            style: AppStyles.textStyle14regular),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormField(
                          controller: cubit.emailController,
                          validator: (email) {
                            if (email?.isEmpty ?? true) {
                              return 'Email Address is Required';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                          onFieldSubmitted: (value) async {
                            if (formKey.currentState!.validate()) {
                              await cubit.loginUser();
                            }
                          },
                          prefixIcon: Icons.email_outlined,
                          hintText: 'namaemail@email.com',
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text('Password',
                            style: AppStyles.textStyle14regular),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormField(
                          obscureText: cubit.obscureText,
                          controller: cubit.passwordController,
                          validator: (password) {
                            if (password?.isEmpty ?? true) {
                              return 'Password is Required';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                          onFieldSubmitted: (value) async {
                            if (formKey.currentState!.validate()) {
                              await cubit.loginUser();
                            }
                          },
                          prefixIcon: Icons.lock_open,
                          hintText: '**** **** **** ',
                          suffixIcon: IconButton(
                              onPressed: () {
                                cubit.changeIconPassword();
                              },
                              icon: cubit.obscureText
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off)),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              'Forget Password?',
                              style: AppStyles.textStyle14regular
                                  .copyWith(color: kPrimaryColor),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomButton(
                          text: 'login',
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              await cubit.loginUser();
                            }
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account?',
                              style: AppStyles.textStyle14,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Register',
                                style: AppStyles.textStyle16regular
                                    .copyWith(color: kPrimaryColor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
