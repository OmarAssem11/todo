import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/features/tasks/data/models/task_model.dart';

@singleton
class TasksHiveService {
  final Box<TaskModel> _taskModelsBox;

  const TasksHiveService(this._taskModelsBox);

  Future<int> createTask(TaskModel taskModel) => _taskModelsBox.add(taskModel);

  Map<dynamic, TaskModel> getTasksMap() => _taskModelsBox.toMap();

  Future<void> editTask(int index, TaskModel taskModel) =>
      _taskModelsBox.putAt(index, taskModel);

  Future<void> deleteTask(int index) => _taskModelsBox.deleteAt(index);
}
