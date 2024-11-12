import 'package:flutter/material.dart';
import 'package:shopy_app/feature/home/presentation/view/widgets/build_carousel_slider_and_indicator.dart';

import '../../../data/model/home_model.dart';

class BuildHomeView extends StatelessWidget {
  const BuildHomeView({super.key, required this.item});
  final HomeModel item;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildCarouselSliderAndIndicator(
          item: item,
        ),
      ],
    );
  }
}
