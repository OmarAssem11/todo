import 'package:flutter/material.dart';
import 'package:todo/features/tasks/data/models/task_model.dart';
import 'package:todo/features/tasks/domain/entities/task.dart';

extension TaskModelMapper on TaskModel {
  Task get fromModel => Task(
        title: title,
        date: date,
        startTime: TimeOfDay.fromDateTime(startTime),
        endTime: TimeOfDay.fromDateTime(endTime),
        reminder: reminder,
        isCompleted: isCompleted,
        isFavorite: isFavorite,
        color: Color(colorValue),
      );
}
