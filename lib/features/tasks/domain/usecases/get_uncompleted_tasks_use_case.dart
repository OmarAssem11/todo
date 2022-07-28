import 'package:dartz/dartz.dart' hide Task;
import 'package:injectable/injectable.dart';
import 'package:todo/core/domain/failure/failure.dart';
import 'package:todo/core/domain/params/no_params.dart';
import 'package:todo/core/domain/usecases/usecase.dart';
import 'package:todo/features/tasks/domain/entities/task.dart';
import 'package:todo/features/tasks/domain/repositories/tasks_repository.dart';

@lazySingleton
class GetUncompletedTasksUseCase implements UseCase<List<Task>, NoParams> {
  final TasksRepository _tasksRepository;

  const GetUncompletedTasksUseCase(this._tasksRepository);

  @override
  Future<Either<Failure, List<Task>>> call(NoParams params) =>
      _tasksRepository.getUncompletedTasks();
}
