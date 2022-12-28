import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(const RecurrenceAppointmentPosition());

class RecurrenceAppointmentPosition extends StatefulWidget {
  const RecurrenceAppointmentPosition({super.key});

  @override
  State<StatefulWidget> createState() => ScheduleExample();
}

String _recurrenceRule = '';

class ScheduleExample extends State<RecurrenceAppointmentPosition> {
  final List<String> _setPosition = <String>[
    'BYSETPOS -1',
    'BYSETPOS -2',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Select BYSETPOS"),
              actions: <Widget>[
                IconButton(icon: const Icon(Icons.arrow_forward), onPressed: () {}),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.party_mode),
                  itemBuilder: (BuildContext context) {
                    return _setPosition.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                  onSelected: (String value) {
                    setState(() {
                      if (value == 'BYSETPOS -1') {
                        _recurrenceRule = 'FREQ=MONTHLY;COUNT=10;BYDAY=TH;BYSETPOS=-1';
                      } else if (value == 'BYSETPOS -2') {
                        _recurrenceRule ='FREQ=MONTHLY;COUNT=10;BYDAY=TH;BYSETPOS=-2';
                      }
                    });
                  },
                ),
              ],
            ),
            body: SfCalendar(
              view: CalendarView.month,
              dataSource: _getCalendarDataSource(),
            )));
  }
}

_AppointmentDataSource _getCalendarDataSource() {
  List<Appointment> appointments = <Appointment>[];
  appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 1)),
      endTime: DateTime.now().add(const Duration(hours: 2)),
      subject: 'Planning',
      color: Colors.orangeAccent,
      recurrenceRule: _recurrenceRule));

  return _AppointmentDataSource(appointments);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}