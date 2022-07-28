import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/core/domain/params/no_params.dart';
import 'package:todo/features/tasks/domain/entities/task.dart';
import 'package:todo/features/tasks/domain/usecases/add_task_to_favorite_use_case.dart';
import 'package:todo/features/tasks/domain/usecases/complete_task_use_case.dart';
import 'package:todo/features/tasks/domain/usecases/create_task_use_case.dart';
import 'package:todo/features/tasks/domain/usecases/delete_task_use_case.dart';
import 'package:todo/features/tasks/domain/usecases/get_all_tasks_use_case.dart';
import 'package:todo/features/tasks/domain/usecases/get_completed_tasks_use_case.dart';
import 'package:todo/features/tasks/domain/usecases/get_favorite_tasks_use_case.dart';
import 'package:todo/features/tasks/domain/usecases/get_tasks_by_date_use_case.dart';
import 'package:todo/features/tasks/domain/usecases/get_uncompleted_tasks_use_case.dart';
import 'package:todo/features/tasks/presentation/cubit/tasks_states.dart';

@injectable
class TasksCubit extends Cubit<TasksState> {
  TasksCubit(
    this._createTaskUseCase,
    this._getAllTasksUseCase,
    this._getCompletedTasksUseCase,
    this._getUncompletedTasksUseCase,
    this._getFavoriteTasksUseCase,
    this._getTasksByDateUseCase,
    this._completeTaskUseCase,
    this._addTaskToFavoriteUseCase,
    this._deleteTaskUseCase,
  ) : super(const TasksInitial());

  final CreateTaskUseCase _createTaskUseCase;
  final GetAllTasksUseCase _getAllTasksUseCase;
  final GetCompletedTasksUseCase _getCompletedTasksUseCase;
  final GetUncompletedTasksUseCase _getUncompletedTasksUseCase;
  final GetFavoriteTasksUseCase _getFavoriteTasksUseCase;
  final GetTasksByDateUseCase _getTasksByDateUseCase;
  final CompleteTaskUseCase _completeTaskUseCase;
  final AddTaskToFavoriteUseCase _addTaskToFavoriteUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;
  List<Task>? allTasks;
  List<Task>? completedTasks;
  List<Task>? uncompletedTasks;
  List<Task>? favoriteTasks;
  late List<Task> selectedDateTasks;

  Future<void> createTask(Task task) async {
    emit(const CreateTaskLoading());
    final result = await _createTaskUseCase(CreateTaskParams(task));
    emit(
      result.fold(
        (failure) => const CreateTaskError(),
        (_) => const CreateTaskSuccess(),
      ),
    );
  }

  Future<void> _getAllTasks() async {
    final result = await _getAllTasksUseCase(const NoParams());
    result.fold(
      (_) {},
      (tasks) => allTasks = tasks,
    );
  }

  Future<void> _getCompletedTasks() async {
    final result = await _getCompletedTasksUseCase(const NoParams());
    result.fold(
      (_) {},
      (tasks) => completedTasks = tasks,
    );
  }

  Future<void> _getUncompletedTasks() async {
    final result = await _getUncompletedTasksUseCase(const NoParams());
    result.fold(
      (_) {},
      (tasks) => uncompletedTasks = tasks,
    );
  }

  Future<void> _getFavoriteTasks() async {
    final result = await _getFavoriteTasksUseCase(const NoParams());
    result.fold(
      (_) {},
      (tasks) => favoriteTasks = tasks,
    );
  }

  Future<void> getBoardTasks() async {
    emit(const GetTasksLoading());
    await _getAllTasks();
    await _getCompletedTasks();
    await _getUncompletedTasks();
    await _getFavoriteTasks();
    if (allTasks != null &&
        completedTasks != null &&
        uncompletedTasks != null &&
        favoriteTasks != null) {
      emit(const GetTasksSuccess());
    } else {
      emit(const GetTasksError());
    }
  }

  Future<void> getTasksByDate(DateTime date) async {
    emit(const GetTasksLoading());
    final result = await _getTasksByDateUseCase(GetTasksByDateParams(date));
    emit(
      result.fold(
        (failure) => const GetTasksError(),
        (tasks) {
          selectedDateTasks = tasks;
          return const GetTasksSuccess();
        },
      ),
    );
  }

  Future<void> completeTask(Task task) async {
    emit(const CompleteTaskLoading());
    final result = await _completeTaskUseCase(CompleteTaskParams(task));
    emit(
      result.fold(
        (failure) => const CompleteTaskError(),
        (_) => const CompleteTaskSuccess(),
      ),
    );
    getBoardTasks();
  }

  Future<void> addTaskToFavorite(Task task) async {
    emit(const AddTaskToFavoriteLoading());
    final result =
        await _addTaskToFavoriteUseCase(AddTaskToFavoriteParams(task));
    emit(
      result.fold(
        (failure) => const AddTaskToFavoriteError(),
        (_) => const AddTaskToFavoriteSuccess(),
      ),
    );
    getBoardTasks();
  }

  Future<void> deleteTask(Task task) async {
    emit(const DeleteTaskLoading());
    final result = await _deleteTaskUseCase(DeleteTaskParams(task));
    emit(
      result.fold(
        (failure) => const DeleteTaskError(),
        (_) => const DeleteTaskSuccess(),
      ),
    );
    getBoardTasks();
  }
}
