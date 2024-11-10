import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopy_app/feature/on_boarding/data/model/on_boarding_model.dart';

class BuildPageViewItem extends StatelessWidget {
  const BuildPageViewItem({
    super.key,
    required this.item,
  });
  final OnBoardingModel item;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: SvgPicture.asset(
          item.image,
        )),
        const SizedBox(height: 30),
        Text(
          item.title,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15.0),
        Text(
          item.body,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
