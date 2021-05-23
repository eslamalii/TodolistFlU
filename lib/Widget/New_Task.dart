import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  final Function fx;

  NewTask(this.fx);

  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final tx = TextEditingController();
  DateTime _selectedDate;

  void _sumbitData() {
    if (tx.text.isEmpty) return;

    widget.fx(tx.text, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: DateTime(2021, 1, 1),
      lastDate: DateTime(2022, 1, 1),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    ).then((value) {
      if (value == null) return;

      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      )),
      child: Container(
        padding: EdgeInsets.only(
          top: 20,
          right: 10,
          left: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "What's your task?"),
              controller: tx,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => _presentDatePicker(),
                  icon: Icon(Icons.calendar_today),
                ),
                IconButton(
                  onPressed: () => _sumbitData(),
                  icon: Icon(Icons.add_task),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
