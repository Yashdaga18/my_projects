import 'package:flutter/material.dart';
import 'package:todoapp/main.dart';

class TodoItem extends StatelessWidget {
  final int id;
  final String task;
  bool isDone;
  var updateList;
  TodoItem(
      {required this.id,
      required this.task,
      required this.isDone,
      required this.updateList});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        title: Text(task),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onTap: () {
          isDone = !isDone;
        },
        tileColor: Colors.teal,
        leading: Icon(
          isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.white,
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Colors.black87,
          onPressed: () {
            // delTask(widget.id);
            objectBox.todoBox.remove(id);
            updateList();
          },
        ),
      ),
    );
  }
}
