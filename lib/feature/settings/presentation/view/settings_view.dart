import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_app/feature/settings/presentation/manger/cubit/settings_cubit.dart';
import 'package:shopy_app/feature/settings/presentation/view/widgets/build_settings_view.dart';

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
            return BuildSettingsView(
              cubit: cubit,
              state: state,
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
