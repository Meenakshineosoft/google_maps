
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'meeting_data_source.dart';
class CalendarEvents extends StatefulWidget {
  const CalendarEvents({Key? key}) : super(key: key);

  @override
  State<CalendarEvents> createState() => _CalendarEventsState();
}

class _CalendarEventsState extends State<CalendarEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfCalendar(
          view: CalendarView.month,
          dataSource: _getCalendarDataSource(),
        //  monthViewSettings: const MonthViewSettings(
             // appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        ));
  }
}

/*DataSource _getCalendarDataSource() {
  final List<Appointment> appointments = <Appointment>[];
  appointments.add(Appointment(
      startTime: DateTime(2022, 2, 27, 9),
      endTime: DateTime(2022, 2, 27, 10),
      subject: 'Last day of month',
      color: Colors.purple,
      recurrenceRule: 'FREQ=MONTHLY;BYMONTHDAY=-1;INTERVAL=1;COUNT=10'));
  return DataSource(appointments);
}

class DataSource extends CalendarDataSource {
  DataSource(List<Appointment> source) {
    appointments = source;
  }
} */
_AppointmentDataSource _getCalendarDataSource() {
  List<Appointment> appointments = <Appointment>[];

  DateTime exceptionDate = DateTime(2019, 12, 20);
  appointments.add(Appointment(
      startTime: DateTime(2019, 12, 16, 10),
      endTime: DateTime(2019, 12, 16, 12),
      subject: 'Occurs daily',
      color: Colors.red,
      recurrenceRule: 'FREQ=DAILY;COUNT=20',
      recurrenceExceptionDates: <DateTime>[exceptionDate]));

  return _AppointmentDataSource(appointments);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
