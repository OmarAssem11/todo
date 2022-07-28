import 'package:dartz/dartz.dart' hide Task;
import 'package:injectable/injectable.dart';
import 'package:todo/core/domain/failure/failure.dart';
import 'package:todo/core/domain/params/app_params.dart';
import 'package:todo/core/domain/usecases/usecase.dart';
import 'package:todo/features/tasks/domain/entities/task.dart';
import 'package:todo/features/tasks/domain/repositories/tasks_repository.dart';

@lazySingleton
class DeleteTaskUseCase implements UseCase<Unit, DeleteTaskParams> {
  final TasksRepository _tasksRepository;

  const DeleteTaskUseCase(this._tasksRepository);

  @override
  Future<Either<Failure, Unit>> call(DeleteTaskParams params) =>
      _tasksRepository.deleteTask(params.task);
}

class DeleteTaskParams extends AppParams {
  final Task task;

  DeleteTaskParams(this.task);

  @override
  List<Object?> get props => [task];
}
