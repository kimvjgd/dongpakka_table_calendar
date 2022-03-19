import 'package:dongpakka_calendar/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class Calendar extends StatelessWidget {
  final DateTime? selectedDay;
  final DateTime focusedDay;
  final OnDaySelected? onDaySelected;
  const Calendar({
    required this.selectedDay,
    required this.focusedDay,
    required this.onDaySelected,
    Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final defaultBoxDeco = BoxDecoration(
        color: Colors.grey[200], borderRadius: BorderRadius.circular(6.0));

    final defaultTextStyle =
        TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w700);



    return TableCalendar(
      locale: 'ko_KR',
      focusedDay: focusedDay,
      firstDay: DateTime(1800),
      lastDay: DateTime(3000),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
      ),
      onDaySelected: onDaySelected,
      selectedDayPredicate: (DateTime date) {
        // date == selectedDay;       이렇게 안한 이유는 시, 분, 초까지는 같을 필요가 없기 떄문이다.
        if (selectedDay == null) {
          return false;
        }
        return date.year == selectedDay!.year &&
            date.month == selectedDay!.month &&
            date.day == selectedDay!.day;
      },
      calendarStyle: CalendarStyle(
          isTodayHighlighted: false,
          // 이제 오늘 날짜는 표시되지 않는다.
          defaultDecoration: defaultBoxDeco,
          weekendDecoration: defaultBoxDeco,
          selectedDecoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(color: PRIMARY_COLOR, width: 1.0),
          ),
        outsideDecoration: BoxDecoration(shape: BoxShape.rectangle),
          defaultTextStyle: defaultTextStyle,
      weekendTextStyle: defaultTextStyle,
      selectedTextStyle: defaultTextStyle.copyWith(color: PRIMARY_COLOR),
      ),
    );
  }
}
