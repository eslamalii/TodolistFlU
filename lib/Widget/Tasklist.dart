import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Model/Task.dart';

class Tasklist extends StatelessWidget {
  final List<Task> tasks;
  final Function _delete;

  Tasklist(this.tasks, this._delete);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: ListTile(
                title: Text(tasks[index].taskNmae),
                subtitle: Text(DateFormat.yMMMEd().format(tasks[index].date)),
                trailing: IconButton(
                    hoverColor: Colors.transparent,
                    padding: EdgeInsets.all(5),
                    color: Theme.of(context).errorColor,
                    onPressed: () {
                      _delete(tasks[index].id);
                    },
                    icon: Icon(Icons.delete_forever))),
          );
        },
        itemCount: tasks.length,
      ),
    );
  }
}
