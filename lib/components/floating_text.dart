import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({Key? key}) : super(key: key);

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 15)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.linear));

    controller?.forward();
    controller?.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller!,
      builder: (context, child) {
        return SizedBox(
          height: (35 + animation!.value).toDouble(),
          child: Align(alignment: Alignment.topCenter, child: child as Widget),
        );
      },
      child: const Text(
        'tap anywhere',
        style: TextStyle(
          fontFamily: 'OpenSans',
          color: Color(0xffE84C4F),
          fontSize: 25,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
