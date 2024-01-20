import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/common/widgets/CartButton.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 38.h,
      leading: const BackButton(color: Colors.white),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      flexibleSpace: FlexibleSpaceBar(
        title: Row(
          children: [
            const Spacer(),
            Text(
              "KAY",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25.sp),
            ),
            const Spacer(
              flex: 2,
            ),
            CartButton(
              color: Colors.white,
              badgeColor: Colors.white,
              textColor: Colors.black,
              
            ),
          ],
        ),
      ),
    );
  }
}
