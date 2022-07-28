import 'package:flutter/material.dart';
import 'package:todo/core/presentation/resources/color_manager.dart';
import 'package:todo/core/presentation/resources/constants_manager.dart';
import 'package:todo/core/presentation/resources/values_manager.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({required this.onChanged});

  final Function(DateTime) onChanged;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final selectedDate = await showDatePicker(
          context: context,
          initialDate: date,
          firstDate: date,
          lastDate: date.add(
            const Duration(days: Constants.daysAddToLastDate),
          ),
        );
        if (selectedDate == null) {
          return;
        }
        setState(() {
          date = selectedDate;
          widget.onChanged(date);
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
              '${date.day}/${date.month}/${date.year}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Icon(
              Icons.calendar_month_outlined,
              color: ColorManager.lightGrey,
            ),
          ],
        ),
      ),
    );
  }
}
