import 'package:flutter/material.dart';
import 'package:shopy_app/constants.dart';
import 'package:shopy_app/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.text});
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(text.toUpperCase(),
            style: AppStyles.textStyle16.copyWith(color: Colors.white)),
      ),
    );
  }
}
