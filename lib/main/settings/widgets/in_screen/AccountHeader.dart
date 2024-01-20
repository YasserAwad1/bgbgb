import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../screens/logIn_screen.dart';

class AccountHeader extends StatelessWidget {
  bool isArabic;

  AccountHeader({super.key, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(
                Icons.person_outline_rounded,
                size: 35,
              ),
              //  ACCOUNT
              Text(
                AppLocalizations.of(context)!.account,
                style: TextStyle(
                  fontSize: 21.sp,
                  fontFamily: "AnekMalayalam",
                ),
              ),
              const Spacer(),
              // LOGOUT
              Padding(
                padding: EdgeInsets.only(right: 7.0.w),
                child: SizedBox(
                  height: 30.h,
                  width: isArabic ? 140.w : 110.w,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).colorScheme.primary,
                        onPrimary: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pushNamed(LogInScreen.routeName);
                    },
                    label: Text(
                      AppLocalizations.of(context)!.logout,
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    icon: const Icon(
                      Icons.logout_rounded,
                      size: 22,
                      color: Colors.red,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Divider(
          thickness: 1,
          indent: 18.w,
          endIndent: 18.w,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ],
    );
  }
}
