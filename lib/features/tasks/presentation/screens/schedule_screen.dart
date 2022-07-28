import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/presentation/resources/strings_manager.dart';
import 'package:todo/core/presentation/widgets/error_indicator.dart';
import 'package:todo/core/presentation/widgets/loading_indicator.dart';
import 'package:todo/features/tasks/presentation/cubit/tasks_cubit.dart';
import 'package:todo/features/tasks/presentation/cubit/tasks_states.dart';
import 'package:todo/features/tasks/presentation/widgets/calendar.dart';
import 'package:todo/features/tasks/presentation/widgets/task_list.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen();

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  late TasksCubit tasksCubit;

  @override
  void initState() {
    super.initState();
    tasksCubit = BlocProvider.of<TasksCubit>(context);
    tasksCubit.getTasksByDate(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.schedule),
      ),
      body: Column(
        children: [
          const Calendar(),
          BlocBuilder<TasksCubit, TasksState>(
            builder: (context, state) => state.maybeWhen(
              getTasksError: () => const ErrorIndicator(),
              getTasksLoading: () => const LoadingIndicator(),
              orElse: () => Expanded(
                child: TaskList(tasksCubit.selectedDateTasks),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
