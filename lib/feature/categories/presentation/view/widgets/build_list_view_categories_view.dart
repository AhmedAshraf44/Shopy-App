import 'package:flutter/material.dart';
import 'package:shopy_app/feature/categories/presentation/view/widgets/build_categories_view.dart';
import 'package:shopy_app/feature/categories/presentation/view/widgets/my_divider.dart';

import '../../../../home/presentation/manger/cubit/home_cubit.dart';

class BuildListViewCategoriesView extends StatelessWidget {
  const BuildListViewCategoriesView({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => BuildCategoriesView(
        item: cubit.categoriesModel!.data.data[index],
      ),
      separatorBuilder: (context, index) => const MyDivider(),
      itemCount: cubit.categoriesModel!.data.data.length,
    );
  }
}
