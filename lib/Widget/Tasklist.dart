import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Model/Task.dart';

class Tasklist extends StatelessWidget {
  final List<Task> tasks;

  Tasklist(this.tasks);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.all(5),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: ListTile(
              title: Text(tasks[index].taskNmae),
              subtitle: Text(DateFormat.yMMMEd().format(tasks[index].date)),
            ),
          );

          // Container(
          //   padding: EdgeInsets.all(5),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(tasks[index].taskNmae),
          //       Text(DateFormat.yMMMEd().format(tasks[index].date)),
          //     ],
          //   ),
          // );
        },
        itemCount: tasks.length,
      ),
    );
  }
}
