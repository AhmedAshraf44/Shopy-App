import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy_app/core/utils/app_router.dart';
import 'package:shopy_app/core/utils/cache_helper.dart';
import 'package:shopy_app/core/utils/widgets/custom_button.dart';
import 'package:shopy_app/core/utils/widgets/custom_text_form_field.dart';
import 'package:shopy_app/feature/settings/presentation/manger/cubit/settings_cubit.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        var cubit = SettingsCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.userModel != null,
          builder: (context) {
            // nameController.text = cubit.userModel!.name;
            // emailController.text = cubit.userModel!.email;
            // phoneController.text = cubit.userModel!.phone;
            return BuildSettingsView(
              cubit: cubit,
              // nameController: nameController,
              // emailController: emailController,
              // phoneController: phoneController,
            );
          },
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class BuildSettingsView extends StatelessWidget {
  const BuildSettingsView({
    super.key,
    required this.cubit,
    // required this.nameController,
    // required this.emailController,
    // required this.phoneController,
  });
  // final TextEditingController nameController;
  // final TextEditingController emailController;

  // final TextEditingController phoneController;
  final SettingsCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          CustomTextFormField(
            controller: cubit.nameController,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your name';
              } else {
                return null;
              }
            },
            prefixIcon: Icons.person,
            hintText: 'Name',
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            controller: cubit.emailController,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your email';
              } else {
                return null;
              }
            },
            prefixIcon: Icons.email_outlined,
            hintText: 'Email',
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            controller: cubit.phoneController,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your phone';
              } else {
                return null;
              }
            },
            prefixIcon: Icons.phone,
            hintText: 'phone',
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            text: 'Logout',
            onPressed: () {
              CacheHelper.removeData(key: 'token');
              GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
            },
          ),
        ],
      ),
    );
  }
}
