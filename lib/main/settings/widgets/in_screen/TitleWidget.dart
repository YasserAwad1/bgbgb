import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.sp),
      child: Text(
        'KAY',
        style: TextStyle(
          fontFamily: "AnekMalayalam",
          fontWeight: FontWeight.bold,
          fontSize: 30.sp,
        ),
      ),
    );
  }
}
