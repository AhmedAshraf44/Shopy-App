import 'package:flutter/material.dart';
import 'package:shopy_app/core/utils/app_styles.dart';
import 'package:shopy_app/feature/register/presentation/manger/cubit/register_cubit.dart';

import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../../core/utils/widgets/custom_text_form_field.dart';

class BuildRegisterView extends StatelessWidget {
  const BuildRegisterView({
    super.key,
    required this.cubit,
  });

  final RegisterCubit cubit;

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
                  'Register',
                  style: AppStyles.textStyle20,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'register now to browse our hot offers',
                  style: AppStyles.textStyle16regular.copyWith(
                    color: Colors.grey[500],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text('Name', style: AppStyles.textStyle14regular),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  controller: cubit.nameController,
                  validator: (name) {
                    if (name?.isEmpty ?? true) {
                      return 'Name is Required';
                    } else {
                      return null;
                    }
                  },
                  // onFieldSubmitted: (value) async {
                  //   if (cubit.formKey.currentState!.validate()) {
                  //     await cubit.loginUser();
                  //   }
                  // },
                  prefixIcon: Icons.person,
                  hintText: 'name',
                ),
                const SizedBox(
                  height: 10.0,
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
                  // onFieldSubmitted: (value) async {
                  //   if (cubit.formKey.currentState!.validate()) {
                  //     await cubit.loginUser();
                  //   }
                  // },
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
                  // onFieldSubmitted: (value) async {
                  //   if (cubit.formKey.currentState!.validate()) {
                  //     await cubit.loginUser();
                  //   }
                  // },
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
                const Text('Phone', style: AppStyles.textStyle14regular),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  controller: cubit.phoneController,
                  validator: (phone) {
                    if (phone?.isEmpty ?? true) {
                      return 'Phone is Required';
                    } else {
                      return null;
                    }
                  },
                  // onFieldSubmitted: (value) async {
                  //   if (cubit.formKey.currentState!.validate()) {
                  //     await cubit.loginUser();
                  //   }
                  // },
                  prefixIcon: Icons.phone,
                  hintText: 'phone',
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  text: 'Register',
                  onPressed: () async {
                    if (cubit.formKey.currentState!.validate()) {
                      await cubit.registerUser();
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
