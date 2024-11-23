import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy_app/core/utils/app_router.dart';
import 'package:shopy_app/core/utils/app_styles.dart';
import 'package:shopy_app/core/utils/service_locator.dart';
import 'package:shopy_app/feature/favorites/data/repos/favorites_repo_impl.dart';
import 'package:shopy_app/feature/favorites/presentation/manger/cubit/favorites_cubit.dart';
import 'package:shopy_app/feature/home/data/repos/home_repo_impl.dart';
import 'package:shopy_app/feature/home/presentation/manger/cubit/home_cubit.dart';
import 'package:shopy_app/feature/layout/presentation/manger/cubit/app_cubit.dart';

class AppLayoutView extends StatelessWidget {
  const AppLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(getIt.get<HomeRepoImpl>())
            ..getHomeData()
            ..getCategories(),
        ),
        BlocProvider(
          create: (context) => FavoritesCubit(
            getIt.get<FavoritesRepoImpl>(),
          )..getFavorites(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Shopy App',
                style: AppStyles.textStyle20,
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kSearchView);
                  },
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
                onTap: (index) {
                  cubit.changeBottomNavIndex(index);
                },
                currentIndex: cubit.currentIndex,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.apps), label: 'Categories'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: 'Favorites'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Settings'),
                ]),
            body: cubit.pages[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
