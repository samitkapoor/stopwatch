import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stopwatch/controller/timer_controller.dart';

import 'package:stopwatch/core/home_page.dart';
import 'package:stopwatch/core/loading_page.dart';

void main() {
  runApp(const StopWatch());
}

class StopWatch extends StatelessWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TimerController -> controls the stop watch operations (Start, pause, time, etc)
    TimerController controller = Get.put(TimerController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoadingPage(),
      getPages: [
        GetPage(name: LoadingPage.routeName, page: () => const LoadingPage()),
        GetPage(name: Homepage.routeName, page: () => Homepage()),
      ],
    );
  }
}
