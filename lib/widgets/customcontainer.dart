import 'package:flutter/material.dart';
import 'package:orderapp/utils/constants.dart';
import 'package:orderapp/utils/helper.dart';

class CustomContainer extends StatelessWidget {
  final Widget? child;
  final double? width;
  const CustomContainer({super.key, required this.child, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Helper.width(),
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        boxShadow: shadow,
      ),
      child: child,
    );
  }
}
