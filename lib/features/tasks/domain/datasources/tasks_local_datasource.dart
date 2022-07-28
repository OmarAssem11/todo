import 'package:todo/features/tasks/data/models/task_model.dart';

abstract class TasksLocalDataSource {
  Future<int> createTask(TaskModel taskModel);

  Future<Map<dynamic, TaskModel>> getTasksMap();

  Future<void> editTask({
    required int index,
    required TaskModel taskModel,
  });

  Future<void> deleteTask(int index);
}
