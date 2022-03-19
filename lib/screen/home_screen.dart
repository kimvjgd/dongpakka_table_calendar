import 'package:dongpakka_calendar/component/calendar.dart';
import 'package:dongpakka_calendar/component/schedule_bottom_sheet.dart';
import 'package:dongpakka_calendar/component/schedule_card.dart';
import 'package:dongpakka_calendar/component/today_banner.dart';
import 'package:dongpakka_calendar/const/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: renderFloatingActionButton(),
      body: SafeArea(
        child: Column(
          children: [
            Calendar(
              selectedDay: selectedDay,
              focusedDay: focusedDay,
              onDaySelected: onDaySelected,
            ),
            SizedBox(
              height: 8.0,
            ),
            TodayBanner(selectedDay: selectedDay, scheduleCount: 3),
            SizedBox(
              height: 8.0,
            ),
            _ScheduleList(),
          ],
        ),
      ),
    );
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
    });
  }

  FloatingActionButton renderFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: PRIMARY_COLOR,
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context, builder: (_){
          return ScheduleBottomSheet();
        });
      },
      child: Icon(Icons.add),
    );
  }
}

class _ScheduleList extends StatelessWidget {
  const _ScheduleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 8,
            );
          },
          itemBuilder: (context, index) {
            return ScheduleCard(
                startTime: 12,
                endTime: 14,
                content: '프로그래밍 공부하기 $index',
                color: Colors.red);
          },
        ),
      ),
    );
  }
}
