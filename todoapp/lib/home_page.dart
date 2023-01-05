import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/models/model.dart';
import 'package:todoapp/todoItems.dart';
import './todolist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final taskController = TextEditingController();
  var toDoList;

  void initState() {
    super.initState();
    setState(() {
      toDoList = objectBox.todoBox.getAll();
    });

    print(toDoList.runtimeType);
    // objectBox.todoBox.removeAll();
    // if (toDoList.isEmpty) {
    //   Todos todo = Todos("Buy football");
    //   objectBox.todoBox.put(todo);
    //   toDoList = objectBox.todoBox.getAll();
    // }
    // for (final todoo in toDoList) {
    //   print(todoo.id);
    // }

    // print(todo.task);
    // List<Todos> todos = objectBox.todoBox.getAll();
    // print(todos[1].id);
    // objectBox.todoBox.removeAll();
    // todos = objectBox.todoBox.getAll();
    // print(todos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown,
      appBar: AppBar(
        elevation: 10,
        title: Text("Todo App"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(4.0, -2.0),
                      color: Colors.black,
                      blurRadius: 3,
                      spreadRadius: 2,
                    ),
                    BoxShadow(
                      offset: Offset(1.0, 1.0),
                      color: Colors.white,
                      blurRadius: 3,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                margin: EdgeInsets.only(
                  bottom: 20,
                ),
                child: TextField(
                  controller: taskController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.task,
                        color: Colors.cyan,
                      ),
                      hintText: "Enter your task",
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        width: 2,
                      ))),
                ),
              ),
              for (var todo in toDoList)
                TodoList(
                  id: todo.id,
                  task: todo.task,
                  isDone: todo.isDone,
                  updateList: _updateList,
                ),
              // TodoList(),
              // TodoList(),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.amberAccent,
                ),
                // color: Colors.amber,
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Icon(Icons.add),
                  // color: Colors.amberAccent,
                  onPressed: () {
                    if (taskController.text.isNotEmpty) {
                      _addTask(taskController);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addTask(var taskController) {
    String text = taskController.text;
    if (text.isNotEmpty) {
      setState(() {
        Todos task = Todos(text);
        objectBox.todoBox.put(task);
        _updateList();
      });
    }

    taskController.clear();
  }

  void _updateList() {
    setState(() {
      toDoList = objectBox.todoBox.getAll();
    });
  }
}
