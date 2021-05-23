import 'package:flutter/material.dart';
import 'package:todolist/Widget/New_Task.dart';
import 'package:todolist/Widget/Tasklist.dart';
import '../Model/Task.dart';

class UserTask extends StatefulWidget {
  @override
  _UserTaskState createState() => _UserTaskState();
}

class _UserTaskState extends State<UserTask> {
  int counter;

  final List<Task> _list = [
    // Task(
    //   id: 1,
    //   taskNmae: 'Eslam',
    //   date: DateTime.now(),
    // ),
    // Task(
    //   id: 2,
    //   taskNmae: 'Ahmed',
    //   date: DateTime.now(),
    // ),
    // Task(
    //   id: 3,
    //   taskNmae: 'Amin',
    //   date: DateTime.now(),
    // ),
    // Task(
    //   id: 4,
    //   taskNmae: 'AS',
    //   date: DateTime.now(),
    // ),
    // Task(
    //   id: 5,
    //   taskNmae: 'AKL',
    //   date: DateTime.now(),
    // ),
  ];

  void _addNewUser(String name, DateTime dateTime) {
    Task task = new Task(
      date: dateTime,
      id: 6,
      taskNmae: name,
    );

    setState(() {
      _list.add(task);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TodoList"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Tasklist(_list),
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
