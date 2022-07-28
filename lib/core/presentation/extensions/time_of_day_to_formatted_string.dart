import 'package:flutter/material.dart';
import 'package:todo/core/presentation/resources/constants_manager.dart';

extension TimeOfDayToFormattedString on TimeOfDay {
  String get toFormattedString {
    final suffix = hour >= 12 ? 'PM' : 'AM';
    final hours = hourOfPeriod.toString().padLeft(2, '0');
    final minutes = minute.toString().padLeft(2, '0');
    return '$hours:$minutes $suffix';
  }
}
