import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_app/feature/favorites/presentation/manger/cubit/favorites_cubit.dart';
import 'package:shopy_app/feature/favorites/presentation/view/widgets/build_list_view_favorites.dart';
import '../../../../core/utils/app_styles.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = FavoritesCubit.get(context);

        return ConditionalBuilder(
          condition: state is! FavoritesLoadingState,
          builder: (context) => cubit.favoriteModel!.data!.data != []
              ? BuildListViewFavorites(cubit: cubit)
              : Center(
                  child: Text(
                  'There are no items in the favorites.',
                  style: AppStyles.textStyle14.copyWith(color: Colors.grey),
                )),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
