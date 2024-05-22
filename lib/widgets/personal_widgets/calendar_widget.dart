import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class WgCalendar extends StatefulWidget {
  final Function(DateTime, DateTime)? $selectElement;
  final DateTime firstDay;
  final DateTime lastDay;

  const WgCalendar({
    super.key,
    required this.firstDay,
    required this.lastDay,
    this.$selectElement,
  });

  @override
  State<WgCalendar> createState() => _WgCalendarState();
}

class _WgCalendarState extends State<WgCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _currentDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: widget.firstDay,
      lastDay: widget.lastDay,
      focusedDay: _selectedDay ?? DateTime.now(),
      currentDay: _currentDay,
      calendarStyle: const CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: Color.fromARGB(255, 138, 223, 184),
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: Color(0xFF9FA8DA),
          shape: BoxShape.circle,
        ),
      ),
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: widget.$selectElement,
      onPageChanged: (focusedDay) {
        _currentDay = focusedDay;
      },
    );
  }
}
