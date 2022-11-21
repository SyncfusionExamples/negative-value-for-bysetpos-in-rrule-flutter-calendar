# How to use a negative value for BYSETPOS in a RRule of recurrence appointment in the Flutter Calendar?

This example demonstrates how to use a negative value for BYSETPOS in a RRule of recurrence appointment in the Flutter Calendar.

## Recurrence appointments on last day of month
By setting the BYSETPOS value to -1 and -2 in the Flutter Event Calendar, you can display the appointments for a certain day of the final week and the week before the last of the month.

In this sample, the recurrence appointment is created on Thursday of the week before last.

```

onSelected: (String value) {
  setState(() {
    if (value == 'BYSETPOS -1') {
      _recurrenceRule = 'FREQ=MONTHLY;COUNT=10;BYDAY=TH;BYSETPOS=-1';
    } else if (value == 'BYSETPOS -2') {
      _recurrenceRule ='FREQ=MONTHLY;COUNT=10;BYDAY=TH;BYSETPOS=-2';
    }
  });
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

```

![BYSETPOS]()

## Requirements to run the demo
* [VS Code](https://code.visualstudio.com/download)
* [Flutter SDK v1.22+](https://flutter.dev/docs/development/tools/sdk/overview)
* [For more development tools](https://flutter.dev/docs/development/tools/devtools/overview)

## How to run this application
To run this application, you need to first clone or download the ‘create a flutter maps widget in 10 minutes’ repository and open it in your preferred IDE. Then, build and run your project to view the output.

## Further help
For more help, check the [Syncfusion Flutter documentation](https://help.syncfusion.com/flutter/introduction/overview),
 [Flutter documentation](https://flutter.dev/docs/get-started/install).