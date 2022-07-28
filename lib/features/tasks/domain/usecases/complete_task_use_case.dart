import 'package:dartz/dartz.dart' hide Task;
import 'package:injectable/injectable.dart';
import 'package:todo/core/domain/failure/failure.dart';
import 'package:todo/core/domain/params/app_params.dart';
import 'package:todo/core/domain/usecases/usecase.dart';
import 'package:todo/features/tasks/domain/entities/task.dart';
import 'package:todo/features/tasks/domain/repositories/tasks_repository.dart';

@lazySingleton
class CompleteTaskUseCase implements UseCase<Unit, CompleteTaskParams> {
  final TasksRepository _tasksRepository;

  const CompleteTaskUseCase(this._tasksRepository);

  @override
  Future<Either<Failure, Unit>> call(CompleteTaskParams params) =>
      _tasksRepository.completeTask(params.task);
}

class CompleteTaskParams extends AppParams {
  final Task task;

  CompleteTaskParams(this.task);

  @override
  List<Object?> get props => [task];
}
