import 'package:flutter/material.dart';
import 'package:todo/core/presentation/resources/constants_manager.dart';

extension TimeOfDayToFormattedString on TimeOfDay {
  String get toFormattedString {
    final hours =
        hour.toString().padLeft(Constants.padWidth, Constants.padReplacement);
    final minutes =
        minute.toString().padLeft(Constants.padWidth, Constants.padReplacement);
    return '$hours:$minutes';
  }
}
