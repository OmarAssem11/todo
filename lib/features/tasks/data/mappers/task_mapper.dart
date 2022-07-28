import 'package:todo/features/tasks/data/models/task_model.dart';
import 'package:todo/features/tasks/domain/entities/task.dart';

extension TaskMapper on Task {
  TaskModel get toModel => TaskModel(
        title: title,
        date: date,
        startTime: DateTime(
          date.year,
          date.month,
          date.day,
          startTime.hour,
          startTime.minute,
        ),
        endTime: DateTime(
          date.year,
          date.month,
          date.day,
          endTime.hour,
          endTime.minute,
        ),
        reminder: reminder,
        isCompleted: isCompleted,
        isFavorite: isFavorite,
        colorValue: color.value,
      );
}
