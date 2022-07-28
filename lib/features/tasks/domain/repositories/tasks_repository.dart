import 'package:dartz/dartz.dart' hide Task;
import 'package:todo/core/domain/failure/failure.dart';
import 'package:todo/features/tasks/domain/entities/task.dart';

abstract class TasksRepository {
  Future<Either<Failure, int>> createTask(Task task);

  Future<Either<Failure, List<Task>>> getAllTasks();

  Future<Either<Failure, List<Task>>> getCompletedTasks();

  Future<Either<Failure, List<Task>>> getUncompletedTasks();

  Future<Either<Failure, List<Task>>> getFavoriteTasks();

  Future<Either<Failure, List<Task>>> getTasksByDate(DateTime date);

  Future<Either<Failure, Unit>> completeTask(Task task);

  Future<Either<Failure, Unit>> addTaskToFavorite(Task task);

  Future<Either<Failure, Unit>> deleteTask(Task task);
}
