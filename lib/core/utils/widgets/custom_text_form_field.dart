import 'package:flutter/material.dart';
import 'package:shopy_app/constants.dart';
import 'package:shopy_app/core/functions/build_boreder.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.validator,
      required this.prefixIcon,
      required this.hintText,
      this.suffixIcon,
      this.onChanged,
      this.onFieldSubmitted,
      this.controller,
      this.obscureText = false});
  final String? Function(String?)? validator;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        focusColor: kPrimaryColor,
        prefixIcon: Icon(prefixIcon),
        hintText: hintText,
        suffixIcon: suffixIcon,
        focusedBorder: buildBoreder(),
        border: buildBoreder(),
      ),
    );
  }
}
