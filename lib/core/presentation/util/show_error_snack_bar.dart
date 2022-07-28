import 'package:flutter/material.dart';
import 'package:todo/core/presentation/resources/color_manager.dart';
import 'package:todo/core/presentation/resources/constants_manager.dart';
import 'package:todo/core/presentation/resources/strings_manager.dart';
import 'package:todo/core/presentation/resources/values_manager.dart';

void showErrorSnackBar(
  BuildContext context, {
  String message = AppStrings.somethingWentWrong,
}) {
  final snackBar = SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(message),
        const Icon(
          Icons.error_outline_rounded,
          color: ColorManager.white,
          size: AppSize.s24,
        ),
      ],
    ),
    duration: const Duration(seconds: Constants.errorSnackBarDuration),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
