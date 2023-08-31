import 'dart:math';

import 'package:flutter/material.dart';
import 'package:to_do_flutter/models/todo_model.dart';

class TodoWidget extends StatefulWidget {
  const TodoWidget(
      {super.key,
      required this.onAddTodo,
      this.todo,
      required this.onUpdateTask});
  final Todo? todo;
  final Function(Todo todo) onAddTodo;
  final Function(Todo todo) onUpdateTask;
  @override
  _TodoWidgetState createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  bool isEditMode = false;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    titleController.text = widget.todo?.title ?? '';
    descriptionController.text = widget.todo?.description ?? '';
    if (widget.todo != null) {
      isEditMode = true;
    }
  }

  void editTask() {
    final editedTask = widget.todo?.copyWith(
        title: titleController.text,
        description: descriptionController.text) as Todo;
    widget.onUpdateTask(editedTask);
    Navigator.pushNamed(context, '/');
  }

  void addTask() {
    final task = Todo(
        index: Random().nextInt(9999),
        title: titleController.text,
        description: descriptionController.text);
    widget.onAddTodo(task);
    Navigator.pushNamed(context, '/', arguments: task);
  }

  @override
  Widget build(BuildContext context) {
    final onPressed = isEditMode == true ? editTask : addTask;
    return Scaffold(
        appBar: AppBar(title: Text('Task')),
        body: Column(children: [
          TextField(
            controller: titleController,
          ),
          TextField(
            controller: descriptionController,
          ),
          TextButton(onPressed: onPressed, child: const Text('Доабвить'))
        ]));
  }
}
