import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:stopwatch/controller/timer_controller.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TimerController>(
      builder: (timerController) {
        String hours = '', minutes = '', seconds = '';
        hours = (timerController.hours.value < 10)
            ? '0${timerController.hours.value}'
            : '${timerController.hours.value}';
        minutes = (timerController.minutes.value < 10)
            ? '0${timerController.minutes.value}'
            : '${timerController.minutes.value}';
        seconds = (timerController.seconds.value < 10)
            ? '0${timerController.seconds.value}'
            : '${timerController.seconds.value}';
        return Text(
          '$hours:$minutes:$seconds',
          style: const TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.white70,
            fontSize: 64,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}
