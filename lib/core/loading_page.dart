import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:stopwatch/core/home_page.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  //fancy loading page that appears before the stopwatch, just for a good look
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 4)).then((x) {
      Get.offAllNamed(Homepage.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Lottie.asset('assets/animations/loadingstopwatch.json'),
      ),
    );
  }
}
