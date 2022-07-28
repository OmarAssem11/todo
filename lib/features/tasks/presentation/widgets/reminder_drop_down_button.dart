import 'package:flutter/material.dart';
import 'package:todo/core/domain/enums/reminder.dart';
import 'package:todo/core/presentation/resources/color_manager.dart';
import 'package:todo/core/presentation/resources/values_manager.dart';

class ReminderDropDownButton extends StatefulWidget {
  const ReminderDropDownButton({required this.onChanged});

  final Function(Reminder) onChanged;

  @override
  State<ReminderDropDownButton> createState() => _ReminderDropDownButtonState();
}

class _ReminderDropDownButtonState extends State<ReminderDropDownButton> {
  final reminders = [
    Reminder.oneDay,
    Reminder.oneHour,
    Reminder.thirtyMin,
    Reminder.tenMin,
  ];
  Reminder value = Reminder.oneDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Insets.i20,
        vertical: Insets.i8,
      ),
      decoration: const BoxDecoration(
        color: ColorManager.offWhite,
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s12)),
      ),
      child: DropdownButton<Reminder>(
        items: reminders
            .map(
              (reminder) => DropdownMenuItem<Reminder>(
                value: reminder,
                child: Text(reminder.text),
              ),
            )
            .toList(),
        value: value,
        onChanged: (selectedValue) {
          if (selectedValue != null) {
            value = selectedValue;
            setState(() => widget.onChanged(value));
          }
        },
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: ColorManager.lightGrey,
        ),
        style: Theme.of(context).textTheme.bodyLarge,
        borderRadius: const BorderRadius.all(Radius.circular(Insets.i16)),
        underline: const SizedBox(),
        dropdownColor: ColorManager.offWhite,
        isExpanded: true,
      ),
    );
  }
}
