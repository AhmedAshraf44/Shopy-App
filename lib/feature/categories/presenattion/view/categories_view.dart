import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_app/core/utils/app_styles.dart';
import 'package:shopy_app/feature/home/data/model/categories_model/categories_data_item_model.dart';
import 'package:shopy_app/feature/home/presentation/manger/cubit/home_cubit.dart';

import 'widgets/my_divider.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.categoriesModel != null,
          builder: (context) => BuildListViewCategoriesView(cubit: cubit),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

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

class BuildCategoriesView extends StatelessWidget {
  const BuildCategoriesView({super.key, required this.item});
  final CategoriesDataItemModel item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              image: NetworkImage(
                item.image,
              ),
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            item.name,
            style: AppStyles.textStyle18,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }
}
