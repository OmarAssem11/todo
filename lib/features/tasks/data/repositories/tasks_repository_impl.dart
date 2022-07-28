import 'package:dartz/dartz.dart' hide Task;
import 'package:injectable/injectable.dart';
import 'package:todo/core/data/exception/app_exception.dart';
import 'package:todo/core/domain/failure/failure.dart';
import 'package:todo/core/domain/failure/return_failure.dart';
import 'package:todo/features/tasks/data/mappers/task_mapper.dart';
import 'package:todo/features/tasks/data/mappers/task_model_mapper.dart';
import 'package:todo/features/tasks/domain/datasources/tasks_local_datasource.dart';
import 'package:todo/features/tasks/domain/entities/task.dart';
import 'package:todo/features/tasks/domain/repositories/tasks_repository.dart';

@LazySingleton(as: TasksRepository)
class TasksRepositoryImpl implements TasksRepository {
  TasksRepositoryImpl(this._tasksLocalDataSource);

  final TasksLocalDataSource _tasksLocalDataSource;
  late List<Task> _allTasks;

  @override
  Future<Either<Failure, int>> createTask(Task task) async {
    try {
      final id = await _tasksLocalDataSource.createTask(task.toModel);
      return right(id);
    } on AppException catch (appException) {
      return left(returnFailure(appException));
    }
  }

  @override
  Future<Either<Failure, List<Task>>> getAllTasks() async {
    try {
      final taskModels = await _tasksLocalDataSource.getAllTasks();
      _allTasks = [];
      taskModels
          .map((taskModel) => _allTasks.add(taskModel.fromModel))
          .toList();
      return right(_allTasks);
    } on AppException catch (appException) {
      return left(returnFailure(appException));
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
    } on AppException catch (appException) {
      return left(returnFailure(appException));
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
    } on AppException catch (appException) {
      return left(returnFailure(appException));
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
    } on AppException catch (appException) {
      return left(returnFailure(appException));
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
    } on AppException catch (appException) {
      return left(returnFailure(appException));
    }
  }

  @override
  Future<Either<Failure, Unit>> completeTask(Task task) async {
    try {
      final index = _allTasks.indexOf(task);
      final updatedTask = task.isCompleted
          ? task.copyWith(isCompleted: false)
          : task.copyWith(isCompleted: true);
      await _tasksLocalDataSource.editTask(
        index: index,
        taskModel: updatedTask.toModel,
      );
      return right(unit);
    } on AppException catch (appException) {
      return left(returnFailure(appException));
    }
  }

  @override
  Future<Either<Failure, Unit>> addTaskToFavorite(Task task) async {
    try {
      final index = _allTasks.indexOf(task);
      final updatedTask = task.isFavorite
          ? task.copyWith(isFavorite: false)
          : task.copyWith(isFavorite: true);
      await _tasksLocalDataSource.editTask(
        index: index,
        taskModel: updatedTask.toModel,
      );
      return right(unit);
    } on AppException catch (appException) {
      return left(returnFailure(appException));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTask(Task task) async {
    try {
      final index = _allTasks.indexOf(task);
      await _tasksLocalDataSource.deleteTask(index);
      _allTasks.remove(task);
      return right(unit);
    } on AppException catch (appException) {
      return left(returnFailure(appException));
    }
  }
}
