import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/language_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TitleContainer extends StatelessWidget {
  final String title;
  TitleContainer({required this.title});
  @override
  Widget build(BuildContext context) {
    bool isArabic = Provider.of<LanguageProvider>(context).isArabic();
    return Container(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.only(
      //     topRight: isArabic ? Radius.zero : Radius.circular(15.sp.sp),
      //     bottomRight: isArabic ? Radius.zero : Radius.circular(15.sp.sp),
      //     topLeft: isArabic ? Radius.circular(15.sp.sp) : Radius.zero,
      //     bottomLeft: isArabic ? Radius.circular(15.sp.sp) : Radius.zero,
      //   ),
      //   color: Theme.of(context).colorScheme.primary,
      // ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: isArabic ? Radius.zero : Radius.circular(10.sp.sp),
          bottomRight: isArabic ? Radius.zero : Radius.circular(10.sp.sp),
          topLeft: isArabic ? Radius.circular(10.sp.sp) : Radius.zero,
          bottomLeft: isArabic ? Radius.circular(10.sp.sp) : Radius.zero,
        ),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 1.sp,
        ),
      ),

      padding: EdgeInsets.all(10.w),
      child: Text(
        title,
        style: TextStyle(
            fontFamily: 'AnekMalayalam',
            color: Theme.of(context).colorScheme.primary,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
