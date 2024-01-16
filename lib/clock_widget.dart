import 'package:flutter/material.dart';

import 'blade.dart';

class ClockWidget extends StatefulWidget {
  final String currentTime;
  final String currentDate;
  final String currentDay;
  final String timeOfDayGreeting;

  const ClockWidget({
    Key? key,
    required this.currentTime,
    required this.currentDate,
    required this.currentDay,
    required this.timeOfDayGreeting,
  }) : super(key: key);

  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 196,
          left: 141.5,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.brown,
            ),
            width: 107.0,
            height: 107.0,
          ),
        ),
        Positioned(
          top: 200,
          left: 190,
          child: BladePage(rotation: DateTime.now().second * 6),
        ),
        Positioned(
          top: 200,
          left: 190,
          child: BladePage(rotation: DateTime.now().second * 6 + 120),
        ),
        Positioned(
          top: 200,
          left: 190,
          child: BladePage(rotation: DateTime.now().second * 6 + 240),
        ),
        Center(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(70)),
              shape: BoxShape.rectangle,
              color: Colors.green,
            ),
            height: 150,
            width: 390,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'আজ তারিখ : ${widget.currentDate} , ${widget.currentDay}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'এখন সময় ${widget.timeOfDayGreeting}: ${widget.currentTime}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
