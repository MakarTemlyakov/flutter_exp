import 'package:flutter/material.dart';
import 'package:to_do_flutter/models/todo_model.dart';
import 'package:to_do_flutter/widgets/todo_list/todo_list_widget.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen(
      {super.key,
      required this.todoList,
      required this.onDeleteTask,
      required this.onChangeStatus});
  final List todoList;
  final Function(int index) onDeleteTask;
  final Function(Todo todo) onChangeStatus;
  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Tasks'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(
              context,
              '/todo',
            ),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: TodoListWidget(
        onChangeStatus: widget.onChangeStatus,
        todoList: widget.todoList,
        onDeleteTask: widget.onDeleteTask,
      ),
    );
  }
}
