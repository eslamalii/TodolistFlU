import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widget/New_Task.dart';
import '../Widget/Tasklist.dart';
import '../Model/Task.dart';

class UserTask extends StatefulWidget {
  @override
  _UserTaskState createState() => _UserTaskState();
}

class _UserTaskState extends State<UserTask> {
  int counter;

  final List<Task> _list = [];

  void _addNewUser(String name, DateTime dateTime) {
    Task task = new Task(
      date: dateTime,
      id: DateTime.now().toString(),
      taskNmae: name,
    );

    setState(() {
      _list.add(task);
    });
  }

  void _deleteTask(String id) {
    setState(() {
      _list.removeWhere((element) => element.id == id);
    });
  }

  void _startNewTaskPage(BuildContext ctx) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTask(_addNewUser),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  Widget _appBar() {
    return Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text("Todolist"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Icon(Icons.add),
                  onTap: () => _startNewTaskPage(context),
                )
              ],
            ),
          )
        : AppBar(
            title: Text("TodoList"),
          );
  }

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = _appBar();

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: appBar,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Tasklist(_list, _deleteTask),
                ],
              ),
            ),
          )
        : Scaffold(
            appBar: appBar,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Tasklist(_list, _deleteTask),
                ],
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: FloatingActionButton(
              onPressed: () => _startNewTaskPage(context),
              child: Icon(Icons.add),
            ),
          );
  }
}
