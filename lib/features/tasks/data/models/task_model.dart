import 'package:hive/hive.dart';
import 'package:todo/core/domain/enums/reminder.dart';
import 'package:todo/core/presentation/resources/constants_manager.dart';

part 'task_model.g.dart';

@HiveType(typeId: Constants.taskModelHiveTypeId)
class TaskModel extends HiveObject {
  @HiveField(Constants.titleHiveFieldId)
  String title;
  @HiveField(Constants.dateHiveFieldId)
  DateTime date;
  @HiveField(Constants.startTimeHiveFieldId)
  DateTime startTime;
  @HiveField(Constants.endTimeHiveFieldId)
  DateTime endTime;
  @HiveField(Constants.reminderHiveFieldId)
  Reminder reminder;
  @HiveField(Constants.isCompletedHiveFieldId)
  bool isCompleted;
  @HiveField(Constants.isFavoriteHiveFieldId)
  bool isFavorite;
  @HiveField(Constants.colorHiveFieldId)
  int colorValue;

  TaskModel({
    required this.title,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.reminder,
    required this.isCompleted,
    required this.isFavorite,
    required this.colorValue,
  });
}
