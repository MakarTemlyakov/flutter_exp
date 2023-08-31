import 'package:flutter/material.dart';
import 'package:to_do_flutter/models/todo_model.dart';

class TodoListWidget extends StatefulWidget {
  const TodoListWidget(
      {Key? key,
      required this.todoList,
      required this.onDeleteTask,
      required this.onChangeStatus})
      : super(key: key);
  final List todoList;
  final Function(int index) onDeleteTask;
  final Function(Todo todo) onChangeStatus;
  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  @override
  Widget build(BuildContext context) {
    final list = widget.todoList;
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: ValueKey(index),
              background: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.redAccent,
                ),
              ),
              onDismissed: (DismissDirection direction) {
                widget.onDeleteTask(index);
              },
              child: _TodoListRowWidget(
                onChangeStatus: widget.onChangeStatus,
                todo: widget.todoList[index],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(height: 20),
          itemCount: widget.todoList.length),
    );
  }
}

class _TodoListRowWidget extends StatefulWidget {
  const _TodoListRowWidget({
    Key? key,
    required this.todo,
    required this.onChangeStatus,
  }) : super(key: key);
  final Todo todo;
  final Function(Todo todo) onChangeStatus;

  @override
  State<_TodoListRowWidget> createState() => _TodoListRowWidgetState();
}

class _TodoListRowWidgetState extends State<_TodoListRowWidget> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = false;
  }

  void onChangeChecked(bool? value) {
    value == true ? false : true;
    isChecked = value!;

    widget.onChangeStatus(widget.todo.copyWith(isDone: true));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: const Color.fromARGB(255, 243, 243, 243),
        child: InkWell(
          onTap: () =>
              Navigator.pushNamed(context, '/todo', arguments: widget.todo),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 5,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.todo.title),
                        Text(
                          widget.todo.description,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Checkbox(
                      onChanged: onChangeChecked,
                      value: isChecked,
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
