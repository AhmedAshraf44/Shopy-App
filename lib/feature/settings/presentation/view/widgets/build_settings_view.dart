import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/cache_helper.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../../core/utils/widgets/custom_text_form_field.dart';
import '../../manger/cubit/settings_cubit.dart';

class BuildSettingsView extends StatelessWidget {
  const BuildSettingsView({
    super.key,
    required this.cubit,
    required this.state,
  });
  final SettingsCubit cubit;
  final SettingsState state;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            if (state is UpdataProfileLoadingState)
              const LinearProgressIndicator(),
            const SizedBox(height: 20),
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
              text: 'Updata',
              onPressed: () {
                if (cubit.formKey.currentState!.validate()) {
                  cubit.updataProfile(
                    name: cubit.nameController.text,
                    email: cubit.emailController.text,
                    phone: cubit.phoneController.text,
                  );
                }
              },
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
      ),
    );
  }
}
