import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_app/feature/home/presentation/manger/cubit/home_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:shopy_app/feature/home/presentation/view/widgets/build_home_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.homeModel != null && cubit.gategoriesModel != null,
          // state is! HomeLoadingState,
          builder: (context) => BuildHomeView(
            item: cubit.homeModel!,
            gategories: cubit.gategoriesModel!,
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
