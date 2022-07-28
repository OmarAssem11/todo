// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/adapters.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../features/tasks/data/datasources/tasks_local_datasource_impl.dart'
    as _i7;
import '../features/tasks/data/models/task_model.dart' as _i4;
import '../features/tasks/data/repositories/tasks_repository_impl.dart' as _i9;
import '../features/tasks/data/services/tasks_hive_service.dart' as _i5;
import '../features/tasks/domain/datasources/tasks_local_datasource.dart'
    as _i6;
import '../features/tasks/domain/repositories/tasks_repository.dart' as _i8;
import '../features/tasks/domain/usecases/add_task_to_favorite_use_case.dart'
    as _i10;
import '../features/tasks/domain/usecases/complete_task_use_case.dart' as _i11;
import '../features/tasks/domain/usecases/create_task_use_case.dart' as _i12;
import '../features/tasks/domain/usecases/delete_task_use_case.dart' as _i13;
import '../features/tasks/domain/usecases/get_all_tasks_use_case.dart' as _i14;
import '../features/tasks/domain/usecases/get_completed_tasks_use_case.dart'
    as _i15;
import '../features/tasks/domain/usecases/get_favorite_tasks_use_case.dart'
    as _i16;
import '../features/tasks/domain/usecases/get_tasks_by_date_use_case.dart'
    as _i17;
import '../features/tasks/domain/usecases/get_uncompleted_tasks_use_case.dart'
    as _i18;
import '../features/tasks/presentation/cubit/tasks_cubit.dart' as _i19;
import 'app_module.dart' as _i20; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  await gh.factoryAsync<_i3.Box<_i4.TaskModel>>(() => appModule.taskModelsBox,
      preResolve: true);
  gh.singleton<_i5.TasksHiveService>(
      _i5.TasksHiveService(get<_i3.Box<_i4.TaskModel>>()));
  gh.lazySingleton<_i6.TasksLocalDataSource>(
      () => _i7.TasksLocalDataSourceImpl(get<_i5.TasksHiveService>()));
  gh.lazySingleton<_i8.TasksRepository>(
      () => _i9.TasksRepositoryImpl(get<_i6.TasksLocalDataSource>()));
  gh.lazySingleton<_i10.AddTaskToFavoriteUseCase>(
      () => _i10.AddTaskToFavoriteUseCase(get<_i8.TasksRepository>()));
  gh.lazySingleton<_i11.CompleteTaskUseCase>(
      () => _i11.CompleteTaskUseCase(get<_i8.TasksRepository>()));
  gh.lazySingleton<_i12.CreateTaskUseCase>(
      () => _i12.CreateTaskUseCase(get<_i8.TasksRepository>()));
  gh.lazySingleton<_i13.DeleteTaskUseCase>(
      () => _i13.DeleteTaskUseCase(get<_i8.TasksRepository>()));
  gh.lazySingleton<_i14.GetAllTasksUseCase>(
      () => _i14.GetAllTasksUseCase(get<_i8.TasksRepository>()));
  gh.lazySingleton<_i15.GetCompletedTasksUseCase>(
      () => _i15.GetCompletedTasksUseCase(get<_i8.TasksRepository>()));
  gh.lazySingleton<_i16.GetFavoriteTasksUseCase>(
      () => _i16.GetFavoriteTasksUseCase(get<_i8.TasksRepository>()));
  gh.lazySingleton<_i17.GetTasksByDateUseCase>(
      () => _i17.GetTasksByDateUseCase(get<_i8.TasksRepository>()));
  gh.lazySingleton<_i18.GetUncompletedTasksUseCase>(
      () => _i18.GetUncompletedTasksUseCase(get<_i8.TasksRepository>()));
  gh.factory<_i19.TasksCubit>(() => _i19.TasksCubit(
      get<_i12.CreateTaskUseCase>(),
      get<_i14.GetAllTasksUseCase>(),
      get<_i15.GetCompletedTasksUseCase>(),
      get<_i18.GetUncompletedTasksUseCase>(),
      get<_i16.GetFavoriteTasksUseCase>(),
      get<_i17.GetTasksByDateUseCase>(),
      get<_i11.CompleteTaskUseCase>(),
      get<_i10.AddTaskToFavoriteUseCase>(),
      get<_i13.DeleteTaskUseCase>()));
  return get;
}

class _$AppModule extends _i20.AppModule {}
