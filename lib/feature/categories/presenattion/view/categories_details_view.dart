import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_app/core/utils/app_styles.dart';
import 'package:shopy_app/core/utils/service_locator.dart';
import 'package:shopy_app/feature/categories/presenattion/manger/cubit/categories_details_cubit.dart';
import '../../../home/presentation/view/widgets/custom_product.dart';
import '../../data/repos/categories_repo_impl.dart';

class CategoriesDetailsView extends StatelessWidget {
  const CategoriesDetailsView({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Category Details',
          style: AppStyles.textStyle20,
        ),
      ),
      body: BlocProvider(
        create: (context) => CategoriesDetailsCubit(
          getIt.get<CategoriesRepoImpl>(),
        )..getCategoriesDetails(id: id),
        child: BlocBuilder<CategoriesDetailsCubit, CategoriesDetailsState>(
          builder: (context, state) {
            var cubit = CategoriesDetailsCubit.get(context);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              child: ConditionalBuilder(
                condition: cubit.categoriesDetailsModel != null,
                builder: (context) => GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    //mainAxisSpacing: 1,
                    childAspectRatio: 1 / 1.75,
                    // crossAxisSpacing: 1,
                  ),
                  itemCount: cubit.categoriesDetailsModel!.data.data.length,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300)),
                    child: CustomProduct(
                      item: cubit.categoriesDetailsModel!.data.data[index],
                    ),
                  ),
                ),
                fallback: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
