import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/presentation/extensions/time_of_day_to_formatted_string.dart';
import 'package:todo/core/presentation/resources/color_manager.dart';
import 'package:todo/core/presentation/resources/radius_manager.dart';
import 'package:todo/core/presentation/resources/values_manager.dart';
import 'package:todo/features/tasks/domain/entities/task.dart';
import 'package:todo/features/tasks/presentation/cubit/tasks_cubit.dart';
import 'package:todo/features/tasks/presentation/widgets/check_mark.dart';

class TaskItem extends StatelessWidget {
  const TaskItem(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;
    final tasksCubit = BlocProvider.of<TasksCubit>(context);
    return Container(
      padding: const EdgeInsets.all(Insets.i20),
      margin: const EdgeInsets.only(
        right: Insets.i12,
        left: Insets.i12,
        top: Insets.i12,
      ),
      decoration: BoxDecoration(
        color: task.color,
        borderRadius: const BorderRadius.all(
          Radius.circular(RadiusManager.r16),
        ),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                task.startTime.toFormattedString,
                style: bodyMedium,
              ),
              const SizedBox(height: AppSize.s12),
              Text(
                task.title,
                style: bodyMedium,
              ),
            ],
          ),
          const Spacer(),
          CheckMark(task: task),
          const SizedBox(width: AppSize.s12),
          IconButton(
            onPressed: () => tasksCubit.addTaskToFavorite(task),
            icon: Icon(
              task.isFavorite ? Icons.favorite : Icons.favorite_outline_rounded,
              color: ColorManager.white,
              size: AppSize.s30,
            ),
          ),
          IconButton(
            onPressed: () => tasksCubit.deleteTask(task),
            icon: const Icon(
              Icons.delete_outline_rounded,
              color: ColorManager.white,
              size: AppSize.s30,
            ),
          ),
        ],
      ),
    );
  }
}
