import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../constants.dart';

void main() {
  runApp(const EventScreen());
}

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);
  static const String routeName = 'EventScreen';

  @override
  // ignore: library_private_types_in_public_api
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  final TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendar"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(right: kDefaultPadding / 2),
            color: Colors.white,
            child: TableCalendar(
              focusedDay: selectedDay,
              firstDay: DateTime(2018),
              lastDay: DateTime(2030),
              calendarFormat: format,
              onFormatChanged: (CalendarFormat newFormat) {
                setState(() {
                  format = newFormat;
                });
              },
              startingDayOfWeek: StartingDayOfWeek.sunday,
              daysOfWeekVisible: true,
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                });
                if (kDebugMode) {
                  print(focusedDay);
                }
              },
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },
              eventLoader: _getEventsfromDay,
              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                defaultTextStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                selectedTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                defaultDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                weekendDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                outsideTextStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                // Customize the font size here
                weekendTextStyle: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 95, 93, 93),
                ),
                todayTextStyle: const TextStyle(fontSize: 14),
              ),
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 95, 93, 93),
                ),
                weekendStyle: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 95, 93, 93),
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: true,
                titleCentered: true,
                formatButtonShowsNext: false,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                formatButtonTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
                headerMargin: const EdgeInsets.symmetric(vertical: 16),
                titleTextStyle: const TextStyle(
                  fontSize:
                      16, // Ubah ukuran font menjadi lebih kecil (misalnya 12)
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          ..._getEventsfromDay(selectedDay).map(
            (Event event) => ListTile(
              title: Text(
                event.title,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Add Event"),
                content: TextFormField(
                  controller: _eventController,
                ),
                actions: [
                  TextButton(
                    child: const Text("Cancel"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  TextButton(
                    child: const Text("Ok"),
                    onPressed: () {
                      if (_eventController.text.isNotEmpty) {
                        if (selectedEvents[selectedDay] != null) {
                          selectedEvents[selectedDay]?.add(
                            Event(title: _eventController.text),
                          );
                        } else {
                          selectedEvents[selectedDay] = [
                            Event(title: _eventController.text)
                          ];
                        }
                      }
                      Navigator.pop(context);
                      setState(() {});
                    },
                  ),
                ],
              );
            },
          ).then((_) {
            _eventController.clear();
          });
        },
        label: const Text("Add Event"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

class Event {
  final String title;

  Event({required this.title});
}
