import 'package:flutter/material.dart';
import 'package:todoapp/main.dart';

class TodoList extends StatefulWidget {
  final int id;
  final String task;
  bool isDone;
  var updateList;
  TodoList(
      {required this.id,
      required this.task,
      required this.isDone,
      required this.updateList});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        title: Text(
          widget.task,
          style: TextStyle(
            decoration: widget.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onTap: () {
          setState(() {
            widget.isDone = !widget.isDone;
          });
        },
        tileColor: Colors.teal,
        leading: Icon(
          widget.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.white,
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Colors.black87,
          onPressed: () {
            setState(() {
              // delTask(widget.id);
              objectBox.todoBox.remove(widget.id);
              widget.updateList();
            });
          },
        ),
      ),
    );
  }

  // void delTask(var id) {
  //   // var item = objectBox.todoBox.get(id);

  //   setState(() {});
  // }
}
