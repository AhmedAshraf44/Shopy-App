import 'package:flutter/material.dart';
import 'package:shopy_app/feature/product_details/presentation/manger/product_details_cubit.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_styles.dart';

class BuildProductDatailsBody extends StatelessWidget {
  const BuildProductDatailsBody({super.key});
  @override
  Widget build(BuildContext context) {
    var item = ProductDetailsCubit.get(context).productDetailsModel!.data!;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(15)),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: AppStyles.textStyle16.copyWith(height: 1.4),
                maxLines: 2,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    r'$'
                    '${item.price.toString()}',
                    style: AppStyles.textStyle14.copyWith(color: kPrimaryColor),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  if (item.discount != 0)
                    Text(
                      '${item.oldPrice}',
                      style: AppStyles.textStyle12.copyWith(
                          color: Colors.grey[400],
                          decoration: TextDecoration.lineThrough),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              Divider(
                height: 1,
                color: Colors.grey[300],
              ),
              const SizedBox(height: 20),
              const Text('Description', style: AppStyles.textStyle14),
              const SizedBox(height: 10),
              Text(
                item.description,
                style: AppStyles.textStyle14.copyWith(color: Colors.grey[400]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
