import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:stopwatch/controller/timer_controller.dart';

class CircularProgressIndicatorWidget extends StatelessWidget {
  CircularProgressIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.size.width - 45,
      height: Get.size.width - 45,
      child: GetBuilder<TimerController>(
        builder: (controller) {
          return CircularProgressIndicator.adaptive(
            value: controller.progressValue.value,
            backgroundColor: Colors.white10,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xffE84C4F)),
            strokeWidth: 35,
          );
        },
      ),
    );
  }
}
