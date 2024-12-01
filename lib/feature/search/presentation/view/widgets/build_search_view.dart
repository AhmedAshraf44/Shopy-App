import 'package:flutter/material.dart';
import 'package:shopy_app/feature/search/presentation/view/widgets/build_list_view_product_item.dart';

import '../../../../../core/utils/widgets/custom_text_form_field.dart';
import '../../../../categories/presentation/view/widgets/my_divider.dart';
import '../../manger/search_cubit.dart';
import '../../manger/search_state.dart';

class BuildSearchView extends StatelessWidget {
  const BuildSearchView({super.key, required this.cubit, required this.state});
  final SearchCubit cubit;
  final SearchState state;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomTextFormField(
              controller: cubit.searchController,
              onFieldSubmitted: (value) {
                if (cubit.formKey.currentState!.validate()) {
                  cubit.search(value);
                }
              },
              onChanged: (value) {
                if (cubit.formKey.currentState!.validate()) {
                  cubit.search(value);
                }
              },
              validator: (String? value) {
                if (value?.isEmpty ?? true) {
                  return 'enter text to search';
                }
                return null;
              },
              prefixIcon: Icons.search,
              hintText: 'Search',
            ),
            const SizedBox(
              height: 10,
            ),
            if (state is SearchLoadingState) const LinearProgressIndicator(),
            if (state is SearchSuccessState)
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => BuildListViewProductItem(
                    model: cubit.searchModel!.data!.data![index],
                    oldPrice: false,
                  ),
                  separatorBuilder: (context, index) => const MyDivider(),
                  itemCount: cubit.searchModel!.data!.data!.length,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
