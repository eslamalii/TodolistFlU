import 'dart:io';

import 'package:flutter/cupertino.dart';
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
    if (tx.text.isEmpty || _selectedDate == null) return;

    widget.fx(tx.text, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    Platform.isIOS
        ? showCupertinoModalPopup(
            context: context,
            builder: (context) => Container(
              height: MediaQuery.of(context).size.height * 0.4,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CupertinoButton(
                          child: Text("Cancel"),
                          onPressed: () => _selectedDate = null,
                        ),
                        CupertinoButton(
                          child: Text("OK"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                    thickness: 1,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: CupertinoDatePicker(
                      onDateTimeChanged: (value) {
                        setState(() {
                          _selectedDate = value;
                        });
                      },
                      initialDateTime: DateTime.now(),
                      maximumDate: DateTime(2022, 1, 1),
                      minimumDate: DateTime(2021, 1, 1),
                    ),
                  ),
                ],
              ),
            ),
          )
        : showDatePicker(
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
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          right: 10,
          left: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Platform.isIOS
                ? CupertinoTextField(
                    placeholder: "What's your task?",
                    controller: tx,
                    maxLines: 1,
                    padding: EdgeInsets.all(10),
                  )
                : TextField(
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
