import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo/core/domain/enums/reminder.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String title,
    required DateTime date,
    required TimeOfDay startTime,
    required TimeOfDay endTime,
    required Reminder reminder,
    @Default(false) bool isCompleted,
    @Default(false) bool isFavorite,
    required Color color,
  }) = _Task;
}
