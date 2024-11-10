import 'package:flutter/material.dart';
import 'package:shopy_app/constants.dart';

OutlineInputBorder buildBoreder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: kPrimaryColor));
}
