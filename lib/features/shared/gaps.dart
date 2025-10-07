import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GapH extends StatelessWidget {
  const GapH(this.height, {super.key});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height.h);
  }
}

class GapW extends StatelessWidget {
  const GapW(this.value, {super.key});
  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: value.w);
  }
}
