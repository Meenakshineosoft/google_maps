import 'dart:ui';

class Meeting {
  Meeting(
      {this.eventName = '',
        required this.from,
        required this.to,
        required this.background,
        this.isAllDay = false,
        this.recurrenceRule});

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
  String? recurrenceRule;
}