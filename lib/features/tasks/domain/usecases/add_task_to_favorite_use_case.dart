import 'package:dartz/dartz.dart' hide Task;
import 'package:injectable/injectable.dart';
import 'package:todo/core/domain/failure/failure.dart';
import 'package:todo/core/domain/params/app_params.dart';
import 'package:todo/core/domain/usecases/usecase.dart';
import 'package:todo/features/tasks/domain/entities/task.dart';
import 'package:todo/features/tasks/domain/repositories/tasks_repository.dart';

@lazySingleton
class AddTaskToFavoriteUseCase
    implements UseCase<Unit, AddTaskToFavoriteParams> {
  final TasksRepository _tasksRepository;

  const AddTaskToFavoriteUseCase(this._tasksRepository);

  @override
  Future<Either<Failure, Unit>> call(AddTaskToFavoriteParams params) =>
      _tasksRepository.addTaskToFavorite(params.task);
}

class AddTaskToFavoriteParams extends AppParams {
  final Task task;

  AddTaskToFavoriteParams(this.task);

  @override
  List<Object?> get props => [task];
}
