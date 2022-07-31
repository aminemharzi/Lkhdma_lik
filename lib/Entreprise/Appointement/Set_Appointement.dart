import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:intl/intl.dart';

class Set_Appointement extends StatefulWidget {
  Set_Appointement({Key? key}) : super(key: key);

  @override
  State<Set_Appointement> createState() => _Set_AppointementState();
}

class _Set_AppointementState extends State<Set_Appointement> {
  bool clicked = false;
  String? _subjectText = '',
      _startTimeText = '',
      _endTimeText = '',
      _dateText = '',
      _timeDetails = '';
  Color? _headerColor, _viewHeaderColor, _calendarColor;
  void calendarTapped(CalendarTapDetails details) {
    if (details.targetElement == CalendarElement.appointment ||
        details.targetElement == CalendarElement.agenda) {
      final Appointment appointmentDetails = details.appointments![0];
      _subjectText = appointmentDetails.subject;
      _dateText = DateFormat('MMMM dd, yyyy')
          .format(appointmentDetails.startTime)
          .toString();
      _startTimeText =
          DateFormat('hh:mm a').format(appointmentDetails.startTime).toString();
      _endTimeText =
          DateFormat('hh:mm a').format(appointmentDetails.endTime).toString();
      if (appointmentDetails.isAllDay) {
        _timeDetails = 'All day';
      } else {
        _timeDetails = '$_startTimeText - $_endTimeText';
      }

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Rendez vous"),
              content: Container(
                height: 80,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          '$_dateText',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(''),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(_timeDetails!,
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15)),
                      ],
                    )
                  ],
                ),
              ),
              actions: [
                RaisedButton(
                  child: Text("Importer la convocation",
                      style: TextStyle(color: Colors.white)),
                  color: Colors.blue,
                  onPressed: () {
                    if (clicked) {
                      final snackBar = SnackBar(
                        content: Text(
                          "Vous éte deja choisi le rendez vous",
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.black,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.of(context).pop();
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                RaisedButton(
                  child: Text("Cancel", style: TextStyle(color: Colors.white)),
                  color: Colors.grey,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                  height: 500,
                  child: SfCalendar(
                    onTap: calendarTapped,
                    view: CalendarView.month,
                    firstDayOfWeek: 1,
                    allowedViews: [
                      CalendarView.month,
                      CalendarView.timelineMonth,
                      CalendarView.schedule
                    ],
                    monthViewSettings: MonthViewSettings(showAgenda: true),
                    onLongPress: (calendarLongPressDetails) {
                      print("Hollls");
                      DateTime startDay = calendarLongPressDetails.date!;
                      print(startDay.toString());
                    },
                    // onTap: calendarTapped,
                    //dataSource: choix_rendez == []
                    // ? null
                    // : MeetingDataSource(getAppointments(choix_rendez)),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
