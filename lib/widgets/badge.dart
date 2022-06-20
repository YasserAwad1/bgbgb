import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Badge extends StatelessWidget {
  const Badge({
    required this.child,
    required this.value,
    required this.color,
  });

  final Widget child;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 8,
          top: 1,
          child: Container(
            padding: const EdgeInsets.all(2.0),
            // color: Theme.of(context).accentColor,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Theme.of(context).colorScheme.secondary,
            ),
            constraints:  BoxConstraints(
              minWidth: 16.w,
              minHeight: 16.h,
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style:  TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        )
      ],
    );
  }
}
