import 'package:dartz/dartz.dart' hide Task;
import 'package:injectable/injectable.dart';
import 'package:todo/core/domain/failure/failure.dart';
import 'package:todo/core/domain/params/app_params.dart';
import 'package:todo/core/domain/usecases/usecase.dart';
import 'package:todo/features/tasks/domain/entities/task.dart';
import 'package:todo/features/tasks/domain/repositories/tasks_repository.dart';

@lazySingleton
class CreateTaskUseCase implements UseCase<int, CreateTaskParams> {
  final TasksRepository _createTaskRepository;

  const CreateTaskUseCase(this._createTaskRepository);

  @override
  Future<Either<Failure, int>> call(CreateTaskParams params) =>
      _createTaskRepository.createTask(params.task);
}

class CreateTaskParams extends AppParams {
  final Task task;

  CreateTaskParams(this.task);

  @override
  List<Object?> get props => [task];
}
