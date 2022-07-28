import 'package:flutter/material.dart';
import 'package:todo/core/presentation/extensions/time_of_day_to_formatted_string.dart';
import 'package:todo/core/presentation/resources/color_manager.dart';
import 'package:todo/core/presentation/resources/values_manager.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({
    required this.initialTime,
    required this.onChanged,
  });

  final TimeOfDay initialTime;
  final Function(TimeOfDay) onChanged;

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  late String time;

  @override
  void initState() {
    super.initState();
    time = widget.initialTime.toFormattedString;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final selectedTime = await showTimePicker(
          context: context,
          initialTime: widget.initialTime,
        );
        if (selectedTime == null) {
          return;
        }
        setState(() {
          time = selectedTime.toFormattedString;
          widget.onChanged(selectedTime);
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Insets.i20,
          vertical: Insets.i16,
        ),
        decoration: const BoxDecoration(
          color: ColorManager.offWhite,
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              time,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Icon(
              Icons.timer_outlined,
              color: ColorManager.lightGrey,
            ),
          ],
        ),
      ),
    );
  }
}
