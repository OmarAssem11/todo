import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/presentation/resources/color_manager.dart';
import 'package:todo/core/presentation/resources/values_manager.dart';
import 'package:todo/features/tasks/domain/entities/task.dart';
import 'package:todo/features/tasks/presentation/cubit/tasks_cubit.dart';

class CheckMark extends StatefulWidget {
  const CheckMark({required this.task});

  final Task task;

  @override
  State<CheckMark> createState() => _CheckMarkState();
}

class _CheckMarkState extends State<CheckMark> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.task.isCompleted;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() => isChecked = !isChecked);
        BlocProvider.of<TasksCubit>(context).completeTask(widget.task);
      },
      child: Container(
        padding: const EdgeInsets.all(Insets.i2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: ColorManager.white,
            width: AppSize.s2,
          ),
        ),
        child: isChecked
            ? const Icon(
                Icons.done,
                color: ColorManager.white,
                size: AppSize.s20,
              )
            : const SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
              ),
      ),
    );
  }
}
