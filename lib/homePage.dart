import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

import 'clock_widget.dart';

class HomPage extends StatefulWidget {
  const HomPage({super.key});

  @override
  _HomPageState createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {
  late Timer _timer;
  late String currentTime;
  late String currentDate;
  late String currentDay;
  late String timeOfDayGreeting;

  @override
  void initState() {
    super.initState();
    updateTime();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      updateTime();
    });
  }

  // @override
  // void dispose() {
  //   _timer.cancel();
  //   super.dispose();
  // }

  void updateTime() {
    var now = tz.TZDateTime.now(tz.getLocation('Asia/Dhaka'));
    setState(() {
      currentTime = DateFormat('h:mm:ss a').format(now);
      currentDate = DateFormat.yMMMMd().format(now);
      currentDay = DateFormat('EEEE').format(now);

      int currentHour = now.hour;
      if (currentHour >= 5 && currentHour < 12) {
        timeOfDayGreeting = 'সকাল 🌤️';
      } else if (currentHour >= 12 && currentHour < 17) {
        timeOfDayGreeting = 'দুপুর 🕛';
      } else if (currentHour >= 17 && currentHour < 20) {
        timeOfDayGreeting = 'বিকেল 🌅';
      } else {
        timeOfDayGreeting = 'রাত 🌃';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 69,
          backgroundColor: Colors.cyan,
          centerTitle: true,
          title: Text('দিন, সময়, এবং তারিখ'),
        ),
        body: Center(
          child: ClockWidget(
            currentTime: currentTime,
            currentDate: currentDate,
            currentDay: currentDay,
            timeOfDayGreeting: timeOfDayGreeting,
          ),
        ),
      ),
    );
  }
}
