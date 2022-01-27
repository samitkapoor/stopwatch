import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  var hours = 0.obs, minutes = 0.obs, seconds = 0.obs, totalSeconds = 0.obs;
  var progressValue = 0.0.obs;
  Timer? timer;

  @override
  void onClose() {
    // TODO: implement onClose
    timer?.cancel();
    super.onClose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      totalSeconds.value += 1;
      seconds.value += 1;
      if (seconds.value == 60) {
        minutes.value += 1;
        seconds.value = 0;
      }
      if (minutes.value == 60) {
        hours.value += 1;
        minutes.value = 0;
        seconds.value = 0;
        progressValue.value = 0;
        totalSeconds.value = 0;
      }
      progressValue.value = (totalSeconds / 3600);
      update();
    });
  }

  void stopTimer() {
    timer?.cancel();
    update();
  }

  void resetTimer() {
    hours.value = minutes.value = seconds.value = totalSeconds.value = 0;
    progressValue.value = 0.0;
    timer?.cancel();
    update();
  }
}
