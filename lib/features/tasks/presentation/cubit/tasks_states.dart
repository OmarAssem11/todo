import 'package:freezed_annotation/freezed_annotation.dart';

part 'tasks_states.freezed.dart';

@freezed
class TasksState with _$TasksState {
  const factory TasksState.initial() = TasksInitial;

  const factory TasksState.createTaskLoading() = CreateTaskLoading;
  const factory TasksState.createTaskSuccess() = CreateTaskSuccess;
  const factory TasksState.createTaskError() = CreateTaskError;

  const factory TasksState.getTasksLoading() = GetTasksLoading;
  const factory TasksState.getTasksSuccess() = GetTasksSuccess;
  const factory TasksState.getTasksError() = GetTasksError;

  const factory TasksState.completeTaskLoading() = CompleteTaskLoading;
  const factory TasksState.completeTaskSuccess() = CompleteTaskSuccess;
  const factory TasksState.completeTaskError() = CompleteTaskError;

  const factory TasksState.addTaskToFavoriteLoading() =
      AddTaskToFavoriteLoading;
  const factory TasksState.addTaskToFavoriteSuccess() =
      AddTaskToFavoriteSuccess;
  const factory TasksState.addTaskToFavoriteError() = AddTaskToFavoriteError;

  const factory TasksState.deleteTaskLoading() = DeleteTaskLoading;
  const factory TasksState.deleteTaskSuccess() = DeleteTaskSuccess;
  const factory TasksState.deleteTaskError() = DeleteTaskError;
}
