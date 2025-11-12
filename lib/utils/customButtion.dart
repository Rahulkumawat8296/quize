import 'package:flutter/cupertino.dart';

class CustomButtion extends StatelessWidget {
  final double height;
  final double width;
  final Widget? child;
  final Color color;

  const CustomButtion(
      {super.key,
      required this.height,
      required this.width,
      required this.color,
      this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: child,
    );
  }
}
