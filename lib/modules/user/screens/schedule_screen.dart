import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  ScheduleScreenState createState() => ScheduleScreenState();
}

class ScheduleScreenState extends State<ScheduleScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Calendar Widget
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay; // Update focusedDay as well
                });
              },
              calendarFormat: CalendarFormat.month,
              startingDayOfWeek: StartingDayOfWeek.sunday,
              calendarStyle: const CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                markerDecoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
              ),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            // Schedule Button
            ElevatedButton(
              onPressed: () {
                // Add functionality to schedule a class
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Schedule Class for $_selectedDay')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
              ),
              child: const Text(
                'Schedule Class',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 20),
            // Upcoming Classes Section
            Expanded(
              child: ListView(
                children: [
                  const Text(
                    'Upcoming Classes',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  // Dummy list items
                  ListTile(
                    title: Text(
                        'Class on ${DateTime.now().add(const Duration(days: 1)).toLocal()}'),
                    subtitle: const Text('Details of the class'),
                  ),
                  ListTile(
                    title: Text(
                        'Class on ${DateTime.now().add(const Duration(days: 3)).toLocal()}'),
                    subtitle: const Text('Details of the class'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
