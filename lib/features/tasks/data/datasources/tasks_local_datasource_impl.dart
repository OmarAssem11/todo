import 'package:injectable/injectable.dart';
import 'package:todo/features/tasks/data/models/task_model.dart';
import 'package:todo/features/tasks/data/services/tasks_hive_service.dart';
import 'package:todo/features/tasks/domain/datasources/tasks_local_datasource.dart';

@LazySingleton(as: TasksLocalDataSource)
class TasksLocalDataSourceImpl implements TasksLocalDataSource {
  final TasksHiveService _tasksHiveService;

  const TasksLocalDataSourceImpl(this._tasksHiveService);

  @override
  Future<int> createTask(TaskModel taskModel) {
    try {
      return _tasksHiveService.createTask(taskModel);
    } catch (exception) {
      throw UnimplementedError();
    }
  }

  @override
  Future<Map<dynamic, TaskModel>> getTasksMap() async {
    try {
      return _tasksHiveService.getTasksMap();
    } catch (exception) {
      throw UnimplementedError();
    }
  }

  @override
  Future<void> editTask({
    required int index,
    required TaskModel taskModel,
  }) {
    try {
      return _tasksHiveService.editTask(index, taskModel);
    } catch (exception) {
      throw UnimplementedError();
    }
  }

  @override
  Future<void> deleteTask(int index) {
    try {
      return _tasksHiveService.deleteTask(index);
    } catch (exception) {
      throw UnimplementedError();
    }
  }
}
