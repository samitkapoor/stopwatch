import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:stopwatch/components/circular_progress_bar.dart';
import 'package:stopwatch/components/floating_text.dart';
import 'package:stopwatch/components/timer_card.dart';
import 'package:stopwatch/controller/timer_controller.dart';

enum WatchState { play, pause }

class Homepage extends StatelessWidget {
  static const routeName = '/home-page';
  WatchState state = WatchState.pause;

  TimerController controller = Get.find<TimerController>();
  //for the random colors on tapping the screen
  int red = Random().nextInt(255);
  int blue = Random().nextInt(255);
  int green = Random().nextInt(255);
  Color splashColor = Colors.blue;

  void generateColor() {
    //generating random colors for each tap
    red = Random().nextInt(255);
    blue = Random().nextInt(255);
    green = Random().nextInt(255);
    splashColor = Color.fromRGBO(red, green, blue, 0.9);
  }

  @override
  Widget build(BuildContext context) {
    generateColor();
    return Scaffold(
      body: Container(
        height: Get.size.height,
        width: Get.size.width,
        color: Colors.black,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicatorWidget(), //Progress indicator behind the time
            const TimerCard(), //Time you see in the center of the screen
            const Positioned(
              //Floating text beneath the circular progress indicator
              bottom: 100,
              child: AnimatedText(),
            ),
            TextButton(
              //Splash effect on tap on the screen
              onPressed: () {
                generateColor();
                if (state == WatchState.pause) {
                  state = WatchState.play;
                  controller.startTimer();
                } else if (state == WatchState.play) {
                  state = WatchState.pause;
                  controller.stopTimer();
                }
              },
              child: SizedBox(
                height: Get.size.height,
                width: Get.size.width,
              ),
              style: ButtonStyle(
                overlayColor: MaterialStateColor.resolveWith(
                  (states) => splashColor,
                ),
              ),
            ),
            Positioned(
              //Refresh Icon on top right
              right: 20,
              top: Get.mediaQuery.padding.top,
              child: IconButton(
                onPressed: () {
                  controller.resetTimer();
                  state = WatchState.pause;
                },
                icon: const Icon(
                  Icons.refresh_rounded,
                  size: 50,
                  color: Colors.white70,
                ),
                tooltip: 'reset',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
