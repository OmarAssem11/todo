import 'package:flutter/material.dart';
import 'package:todo/core/presentation/resources/strings_manager.dart';
import 'package:todo/features/tasks/presentation/screens/board_screen.dart';
import 'package:todo/features/tasks/presentation/screens/create_task_screen.dart';
import 'package:todo/features/tasks/presentation/screens/schedule_screen.dart';

class AppRoutes {
  static const String board = '/';
  static const String createTask = '/create_task';
  static const String schedule = '/schedule';
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.board:
      return MaterialPageRoute(
        builder: (_) => const BoardScreen(),
      );
    case AppRoutes.createTask:
      return MaterialPageRoute(
        builder: (_) => const CreateTaskScreen(),
      );
    case AppRoutes.schedule:
      return MaterialPageRoute(
        builder: (_) => const ScheduleScreen(),
      );
    default:
      return undefinedRoute();
  }
}

Route<dynamic> undefinedRoute() => MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
      ),
    );
