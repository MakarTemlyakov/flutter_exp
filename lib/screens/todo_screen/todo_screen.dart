import 'package:flutter/material.dart';
import 'package:to_do_flutter/models/todo_model.dart';
import 'package:to_do_flutter/widgets/todo/todo_widget.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen(
      {super.key,
      required this.onAddTodo,
      this.todo,
      required this.onUpdateTask});
  final Todo? todo;
  final Function(Todo todo) onAddTodo;
  final Function(Todo todo) onUpdateTask;

  @override
  Widget build(BuildContext context) {
    return TodoWidget(
      onAddTodo: onAddTodo,
      todo: todo,
      onUpdateTask: onUpdateTask,
    );
  }
}
