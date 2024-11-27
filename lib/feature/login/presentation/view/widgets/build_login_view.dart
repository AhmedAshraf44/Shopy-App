import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../../core/utils/widgets/custom_text_form_field.dart';
import '../../manger/login_cubit/login_cubit.dart';

class BuildLoginView extends StatelessWidget {
  const BuildLoginView({
    super.key,
    required this.cubit,
  });

  final LoginCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
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
                    if (cubit.formKey.currentState!.validate()) {
                      await cubit.loginUser();
                    }
                  },
                  prefixIcon: Icons.email_outlined,
                  hintText: 'namaemail@email.com',
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text('Password', style: AppStyles.textStyle14regular),
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
                    if (cubit.formKey.currentState!.validate()) {
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
                    if (cubit.formKey.currentState!.validate()) {
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
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.kRegisterView);
                      },
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
  }
}
