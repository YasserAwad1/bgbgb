import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../common/widgets/CartButton.dart';

class FavoritesTopBar extends StatelessWidget {
  bool isArabic;
  FavoritesTopBar({
    super.key,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.only(
                  topRight: isArabic ? Radius.zero : Radius.circular(15.sp),
                  bottomRight: isArabic ? Radius.zero : Radius.circular(15.sp),
                  topLeft: isArabic ? Radius.circular(15.sp) : Radius.zero,
                  bottomLeft: isArabic ? Radius.circular(15.sp) : Radius.zero,
                )),
            // YOUR FAVORITES
            child: Text(
              AppLocalizations.of(context)!.yourfav,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
           CartButton(),
        ],
      ),
    );
  }
}
