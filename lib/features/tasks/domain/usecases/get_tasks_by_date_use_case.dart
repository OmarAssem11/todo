import 'package:dartz/dartz.dart' hide Task;
import 'package:injectable/injectable.dart';
import 'package:todo/core/domain/failure/failure.dart';
import 'package:todo/core/domain/params/app_params.dart';
import 'package:todo/core/domain/usecases/usecase.dart';
import 'package:todo/features/tasks/domain/entities/task.dart';
import 'package:todo/features/tasks/domain/repositories/tasks_repository.dart';

@lazySingleton
class GetTasksByDateUseCase
    implements UseCase<List<Task>, GetTasksByDateParams> {
  final TasksRepository _tasksRepository;

  const GetTasksByDateUseCase(this._tasksRepository);

  @override
  Future<Either<Failure, List<Task>>> call(GetTasksByDateParams params) =>
      _tasksRepository.getTasksByDate(params.date);
}

class GetTasksByDateParams extends AppParams {
  final DateTime date;

  GetTasksByDateParams(this.date);

  @override
  List<Object?> get props => [date];
}
