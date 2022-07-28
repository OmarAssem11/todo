import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/core/domain/enums/reminder.dart';
import 'package:todo/core/presentation/resources/constants_manager.dart';
import 'package:todo/features/tasks/data/models/task_model.dart';

@module
abstract class AppModule {
  @preResolve
  Future<Box<TaskModel>> get taskModelsBox async {
    await Hive.initFlutter();
    Hive.registerAdapter(ReminderAdapter());
    Hive.registerAdapter(TaskModelAdapter());
    return Hive.openBox<TaskModel>(Constants.tasksHiveBoxName);
  }
}
