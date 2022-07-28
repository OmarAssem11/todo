import 'package:dartz/dartz.dart' hide Task;
import 'package:injectable/injectable.dart';
import 'package:todo/core/domain/failure/failure.dart';
import 'package:todo/features/tasks/data/mappers/task_mapper.dart';
import 'package:todo/features/tasks/data/mappers/task_model_mapper.dart';
import 'package:todo/features/tasks/domain/datasources/tasks_local_datasource.dart';
import 'package:todo/features/tasks/domain/entities/task.dart';
import 'package:todo/features/tasks/domain/repositories/tasks_repository.dart';

@LazySingleton(as: TasksRepository)
class TasksRepositoryImpl implements TasksRepository {
  TasksRepositoryImpl(this._tasksLocalDataSource);

  final TasksLocalDataSource _tasksLocalDataSource;
  final Map<dynamic, Task> _tasksMap = {};
  late List<Task> _allTasks;

  int _getTaskIndex(Task task) =>
      _tasksMap.keys.firstWhere((key) => _tasksMap[key] == task) as int;

  @override
  Future<Either<Failure, int>> createTask(Task task) async {
    try {
      final id = await _tasksLocalDataSource.createTask(task.toModel);
      return right(id);
    } catch (error) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<Task>>> getAllTasks() async {
    try {
      final taskModelsMap = await _tasksLocalDataSource.getTasksMap();
      for (int i = 0; i < taskModelsMap.length; i++) {
        _tasksMap[taskModelsMap.keys.toList()[i]] =
            taskModelsMap.values.toList()[i].fromModel;
      }
      _allTasks = _tasksMap.values.toList();
      return right(_allTasks);
    } catch (error) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<Task>>> getCompletedTasks() async {
    try {
      final completedTasks = <Task>[];
      _allTasks.map((task) {
        if (task.isCompleted) {
          completedTasks.add(task);
        }
      }).toList();
      return right(completedTasks);
    } catch (error) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<Task>>> getUncompletedTasks() async {
    try {
      final uncompletedTasks = <Task>[];
      _allTasks.map((task) {
        if (!task.isCompleted) {
          uncompletedTasks.add(task);
        }
      }).toList();
      return right(uncompletedTasks);
    } catch (error) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<Task>>> getFavoriteTasks() async {
    try {
      final favoriteTasks = <Task>[];
      _allTasks.map((task) {
        if (task.isFavorite) {
          favoriteTasks.add(task);
        }
      }).toList();
      return right(favoriteTasks);
    } catch (error) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<Task>>> getTasksByDate(DateTime date) async {
    try {
      final selectedDateTasks = <Task>[];
      _allTasks.map((task) {
        if (task.date.day == date.day &&
            task.date.month == date.month &&
            task.date.year == date.year) {
          selectedDateTasks.add(task);
        }
      }).toList();
      return right(selectedDateTasks);
    } catch (error) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, Unit>> completeTask(Task task) async {
    try {
      final index = _getTaskIndex(task);
      final updatedTask = task.isCompleted
          ? task.copyWith(isCompleted: false)
          : task.copyWith(isCompleted: true);
      await _tasksLocalDataSource.editTask(
        index: index,
        taskModel: updatedTask.toModel,
      );
      return right(unit);
    } catch (error) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addTaskToFavorite(Task task) async {
    try {
      final index = _getTaskIndex(task);
      final updatedTask = task.isFavorite
          ? task.copyWith(isFavorite: false)
          : task.copyWith(isFavorite: true);
      await _tasksLocalDataSource.editTask(
        index: index,
        taskModel: updatedTask.toModel,
      );
      return right(unit);
    } catch (error) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTask(Task task) async {
    try {
      final index = _getTaskIndex(task);
      await _tasksLocalDataSource.deleteTask(index);
      return right(unit);
    } catch (error) {
      return left(Failure());
    }
  }
}
