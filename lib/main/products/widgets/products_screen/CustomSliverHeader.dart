import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sliver_header_delegate/sliver_header_delegate.dart';

import '../../../../models/section_model.dart';

class CustomSliverHeader extends StatelessWidget {
  SectionModel section;
  CustomSliverHeader({
    super.key,
    required this.section,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: FlexibleHeaderDelegate(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        collapsedHeight: 60.h,
        expandedHeight: 80.h,
        expandedElevation: 10,
        leading: Container(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 180.w,
                child: Text(
                  section.quote,
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Icon(
                IconData(section.icon, fontFamily: 'MaterialIcons'),
                size: 50.sp,
                color: Colors.white,
              )
            ],
          ),
        ],
      ),
    );
  }
}
