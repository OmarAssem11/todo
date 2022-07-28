import 'package:hive/hive.dart';
import 'package:todo/core/presentation/resources/constants_manager.dart';
import 'package:todo/core/presentation/resources/strings_manager.dart';

part 'reminder.g.dart';

@HiveType(typeId: Constants.reminderHiveTypeId)
enum Reminder {
  @HiveField(Constants.oneDayHiveFieldId)
  oneDay(AppStrings.oneDay),
  @HiveField(Constants.oneHourHiveFieldId)
  oneHour(AppStrings.oneHour),
  @HiveField(Constants.thirtyMinHiveFieldId)
  thirtyMin(AppStrings.thirtyMin),
  @HiveField(Constants.tenMinHiveFieldId)
  tenMin(AppStrings.tenMin);

  final String text;
  const Reminder(this.text);
}
