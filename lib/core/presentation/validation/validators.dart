import 'package:todo/core/presentation/resources/strings_manager.dart';

String? generalValidator({
  required String fieldName,
  required String? value,
}) {
  if (value == null || value.isEmpty) {
    return '$fieldName ${AppStrings.canNotBeEmpty}';
  }
  return null;
}
