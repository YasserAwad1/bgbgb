import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../screens/become_a_seller/become_a_seller_form_screen.dart';

class NextButton extends StatelessWidget {
  bool agree;
  NextButton({
    super.key,
    required this.agree,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50.h,
        width: 150.w,
        margin: EdgeInsets.all(5.sp),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.sp),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor:
                  agree ? Theme.of(context).colorScheme.secondary : Colors.grey,
            ),
            onPressed: () {
              agree
                  ? Navigator.of(context)
                      .pushNamed(BecomeASellerFormScreen.routeName)
                  : null;
            },
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.next,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
