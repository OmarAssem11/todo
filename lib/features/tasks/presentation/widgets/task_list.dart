import 'package:flutter/material.dart';
import 'package:todo/features/tasks/domain/entities/task.dart';
import 'package:todo/features/tasks/presentation/widgets/task_item.dart';

class TaskList extends StatelessWidget {
  const TaskList(this.tasks);

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => TaskItem(tasks[index]),
      itemCount: tasks.length,
    );
  }
}
