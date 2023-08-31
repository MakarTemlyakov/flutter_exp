import 'package:flutter/material.dart';
import 'package:to_do_flutter/models/todo_model.dart';
import 'package:to_do_flutter/navigator/navigator.dart';
import 'package:to_do_flutter/screens/todo_list_screen/todo_list_screen.dart';
import 'package:to_do_flutter/screens/todo_screen/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  List<Todo> todoList = [];

  void onAddTask(Todo todo) {
    setState(() {
      todoList = [...todoList, todo];
    });
  }

  void onDeleteTask(int index) {
    todoList.removeAt(index);
    todoList.map((el) => print(el));
    setState(() {});
  }

  void onUpdateTask(Todo todo) {
    var list = todoList;
    var searchETask = list.firstWhere((element) => element.index == todo.index);
    var taskIndex = list.indexOf(searchETask);
    list[taskIndex] = todo;

    setState(() {
      todoList = list;
    });
  }

  void onChangeStatus(Todo todo) {
    var list = todoList;
    var searchETask = list.firstWhere((element) => element.index == todo.index);
    var taskIndex = list.indexOf(searchETask);
    list[taskIndex] = todo;

    setState(() {
      todoList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppNavigator.main:
            return MaterialPageRoute<void>(builder: (context) {
              return TodoListScreen(
                onChangeStatus: onChangeStatus,
                onDeleteTask: onDeleteTask,
                todoList: todoList,
              );
            });

          case AppNavigator.todo:
            final todo = settings.arguments as Todo?;
            return MaterialPageRoute<void>(builder: (context) {
              return TodoScreen(
                todo: todo,
                onAddTodo: onAddTask,
                onUpdateTask: onUpdateTask,
              );
            });
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
