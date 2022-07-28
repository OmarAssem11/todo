import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/domain/enums/reminder.dart';
import 'package:todo/core/presentation/resources/color_manager.dart';
import 'package:todo/core/presentation/resources/routes_manager.dart';
import 'package:todo/core/presentation/resources/strings_manager.dart';
import 'package:todo/core/presentation/resources/values_manager.dart';
import 'package:todo/core/presentation/util/show_error_snack_bar.dart';
import 'package:todo/core/presentation/validation/validators.dart';
import 'package:todo/core/presentation/widgets/custom_elevated_button.dart';
import 'package:todo/features/tasks/domain/entities/task.dart';
import 'package:todo/features/tasks/presentation/cubit/tasks_cubit.dart';
import 'package:todo/features/tasks/presentation/cubit/tasks_states.dart';
import 'package:todo/features/tasks/presentation/widgets/color_drop_down_button.dart';
import 'package:todo/features/tasks/presentation/widgets/date_picker.dart';
import 'package:todo/features/tasks/presentation/widgets/reminder_drop_down_button.dart';
import 'package:todo/features/tasks/presentation/widgets/time_picker.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen();

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  DateTime date = DateTime.now();
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime =
      TimeOfDay.fromDateTime(DateTime.now().add(const Duration(hours: 3)));
  Reminder reminder = Reminder.oneDay;
  Color color = ColorManager.red;
  bool isLoading = false;
  late TextTheme textTheme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    textTheme = Theme.of(context).textTheme;
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(AppStrings.addTask),
        actions: [
          ColorDropDownButton(
            onChanged: (selectedColor) => color = selectedColor,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(Insets.i16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.title,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: AppSize.s20),
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: AppStrings.enterTaskTitle,
                ),
                validator: (value) => generalValidator(
                  fieldName: AppStrings.title,
                  value: value,
                ),
              ),
              const SizedBox(height: AppSize.s20),
              Text(
                AppStrings.date,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: AppSize.s20),
              DatePicker(
                onChanged: (selectedDate) => date = selectedDate,
              ),
              const SizedBox(height: AppSize.s20),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      AppStrings.startTime,
                      style: textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(width: AppSize.s16),
                  Expanded(
                    child: Text(
                      AppStrings.endTime,
                      style: textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s20),
              Row(
                children: [
                  Expanded(
                    child: TimePicker(
                      initialTime: startTime,
                      onChanged: (selectedTime) => startTime = selectedTime,
                    ),
                  ),
                  const SizedBox(width: AppSize.s16),
                  Expanded(
                    child: TimePicker(
                      initialTime: endTime,
                      onChanged: (selectedTime) => endTime = selectedTime,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s20),
              Text(
                AppStrings.reminder,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: AppSize.s20),
              ReminderDropDownButton(
                onChanged: (selectedReminder) => reminder = selectedReminder,
              ),
              const Spacer(),
              BlocConsumer<TasksCubit, TasksState>(
                listener: (context, state) => state.mapOrNull(
                  createTaskLoading: (_) => isLoading = true,
                  createTaskError: (_) => showErrorSnackBar(context),
                  createTaskSuccess: (_) => Navigator.of(context)
                      .pushReplacementNamed(AppRoutes.board),
                ),
                builder: (context, state) => CustomElevatedButton(
                  label: AppStrings.createTask,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<TasksCubit>(context).createTask(
                        Task(
                          title: titleController.text,
                          date: date,
                          startTime: startTime,
                          endTime: endTime,
                          reminder: reminder,
                          color: color,
                        ),
                      );
                    }
                  },
                  isLoading: isLoading,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
