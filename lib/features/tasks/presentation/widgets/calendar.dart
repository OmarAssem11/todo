import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/core/presentation/resources/color_manager.dart';
import 'package:todo/core/presentation/resources/constants_manager.dart';
import 'package:todo/features/tasks/presentation/cubit/tasks_cubit.dart';

class Calendar extends StatefulWidget {
  const Calendar();

  @override
  State<Calendar> createState() => _TableCalendarState();
}

class _TableCalendarState extends State<Calendar> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: _focusedDay,
      firstDay: DateTime.now().subtract(
        const Duration(days: Constants.calendarFirstDaysFromNow),
      ),
      lastDay: DateTime.now().add(
        const Duration(days: Constants.calendarFirstDaysFromNow),
      ),
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      onDaySelected: (selectedDay, focusedDay) => setState(
        () {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
          BlocProvider.of<TasksCubit>(context).getTasksByDate(selectedDay);
        },
      ),
      headerVisible: false,
      calendarFormat: CalendarFormat.week,
      calendarStyle: const CalendarStyle(
        isTodayHighlighted: false,
        defaultTextStyle: TextStyle(color: ColorManager.black),
        defaultDecoration: BoxDecoration(color: ColorManager.white),
        selectedDecoration: BoxDecoration(color: ColorManager.primary),
      ),
    );
  }
}
