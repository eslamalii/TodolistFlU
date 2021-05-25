import 'package:flutter/foundation.dart';

class Task {
  final String id;
  final String taskNmae;
  final DateTime date;

  Task({@required this.date, @required this.id, @required this.taskNmae});
}
