import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/presentation/resources/color_manager.dart';
import 'package:todo/core/presentation/resources/constants_manager.dart';
import 'package:todo/core/presentation/resources/routes_manager.dart';
import 'package:todo/core/presentation/resources/strings_manager.dart';
import 'package:todo/core/presentation/resources/values_manager.dart';
import 'package:todo/core/presentation/util/show_error_snack_bar.dart';
import 'package:todo/core/presentation/widgets/custom_elevated_button.dart';
import 'package:todo/core/presentation/widgets/error_indicator.dart';
import 'package:todo/core/presentation/widgets/loading_indicator.dart';
import 'package:todo/features/tasks/presentation/cubit/tasks_cubit.dart';
import 'package:todo/features/tasks/presentation/cubit/tasks_states.dart';
import 'package:todo/features/tasks/presentation/widgets/task_list.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen();

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  late TasksCubit tasksCubit;

  @override
  void initState() {
    super.initState();
    tasksCubit = BlocProvider.of<TasksCubit>(context);
    tasksCubit.getBoardTasks();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Constants.tabsNumber,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.board),
          actions: [
            IconButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(AppRoutes.schedule),
              icon: const Icon(Icons.calendar_month_outlined),
            ),
          ],
          bottom: const TabBar(
            indicatorColor: ColorManager.black,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(text: AppStrings.all),
              Tab(text: AppStrings.completed),
              Tab(text: AppStrings.uncompleted),
              Tab(text: AppStrings.favorite),
            ],
          ),
        ),
        body: BlocConsumer<TasksCubit, TasksState>(
          listener: (context, state) => state.mapOrNull(
            completeTaskError: (_) => showErrorSnackBar(context),
            addTaskToFavoriteError: (_) => showErrorSnackBar(context),
            deleteTaskError: (_) => showErrorSnackBar(context),
          ),
          builder: (context, state) => state.maybeWhen(
            getTasksLoading: () => const LoadingIndicator(),
            getTasksError: () => const ErrorIndicator(),
            getTasksSuccess: () => TabBarView(
              children: [
                TaskList(tasksCubit.allTasks!),
                TaskList(tasksCubit.completedTasks!),
                TaskList(tasksCubit.uncompletedTasks!),
                TaskList(tasksCubit.favoriteTasks!),
              ],
            ),
            orElse: () => const SizedBox(),
          ),
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.all(Insets.i12),
          child: CustomElevatedButton(
            label: AppStrings.addTask,
            onPressed: () =>
                Navigator.of(context).pushNamed(AppRoutes.createTask),
          ),
        ),
      ),
    );
  }
}
