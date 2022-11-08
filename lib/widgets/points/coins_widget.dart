import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

class CoinsWidget extends StatelessWidget {
  const CoinsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 170,
          width: 170,
          child: RiveAnimation.asset('assets/coins.riv'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have 300 Points',
              style: TextStyle(
                  fontSize: 17.sp,
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 15.w,
            ),
            Tooltip(
              showDuration: Duration(seconds: 20),
              textStyle: TextStyle(
                  fontSize: 14.sp,
                  // color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold),
              triggerMode: TooltipTriggerMode.tap,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(10)),
              message:
                  'Earn more points by shopping and reviewing already purchased products,earn 100 points to get a 10% discount on your next order',
              child: CircleAvatar(
                  radius: 10.sp,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: Icon(
                    Icons.question_mark_sharp,
                    size: 15.sp,
                    // color: Theme.of(context).colorScheme.secondary,
                  )),
            )
          ],
        ),
      ],
    );
  }
}
