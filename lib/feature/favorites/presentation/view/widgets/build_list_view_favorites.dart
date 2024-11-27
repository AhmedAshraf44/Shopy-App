import 'package:flutter/material.dart';
import 'package:shopy_app/feature/favorites/presentation/view/widgets/build_list_view_favorites_item.dart';

import '../../../../categories/presentation/view/widgets/my_divider.dart';
import '../../manger/cubit/favorites_cubit.dart';

class BuildListViewFavorites extends StatelessWidget {
  const BuildListViewFavorites({
    super.key,
    required this.cubit,
  });

  final FavoritesCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => BuildListViewFavoritesItem(
        model: cubit.favoriteModel!.data!.data![index],
      ),
      separatorBuilder: (context, index) => const MyDivider(),
      itemCount: cubit.favoriteModel!.data!.data!.length,
      //cubit.categoriesModel!.data.data.length,
    );
  }
}
