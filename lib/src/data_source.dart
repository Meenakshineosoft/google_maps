import 'dart:ui';

import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'meeting.dart';


class _DataSource extends CalendarDataSource<Meeting> {
  _DataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from as DateTime;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to as DateTime;
  }

  @override
  String getSubject(int index) {
    return appointments![index].content as String;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background as Color;
  }

  @override
  Meeting convertAppointmentToObject(
      Meeting customData, Appointment appointment) {
    return Meeting(
        from: appointment.startTime,
        to: appointment.endTime,
        //content: appointment.subject,
        background: appointment.color,
        isAllDay: appointment.isAllDay);
  }
}

